import { PhotosItemInterface } from "../viewmodel/PhotosItemInterface";
import { image } from "@kit.ImageKit";
import { ControllerPhotosInterface } from "../controller/ControllerPhotosInterface";
import fs from '@ohos.file.fs';

@Component
export struct ImageComponent {

  @State image: string = "";
  @State image1: PixelMap | undefined = undefined; //创建PixelMap状态变量。

  @State filePath: string = "";

  private videoController: VideoController = new VideoController();

  item: PhotosItemInterface = {} as PhotosItemInterface;
  controller?: ControllerPhotosInterface;

  aboutToAppear(): void {
    // let imageSource: image.ImageSource = image.createImageSource(this.item.assetUrl);

    this.controller?.loadImage2Local(this.item.assetUrl).then((imageData: ArrayBuffer) => {
      // console.log("loadImage2Local localPath:", localPath);
      // let imageUri = `file:/${localPath}`; // 构建完整的 file:// URI
      // this.image = imageUri;
      // TODO: this.item.isImage === false 显示视频缩略图

      if ( this.item.isImage ) {
        let imageSource: image.ImageSource = image.createImageSource(imageData);
        let options: image.DecodingOptions = {
          'desiredPixelFormat': image.PixelMapFormat.RGBA_8888,
        };
        imageSource.createPixelMap(options).then((pixelMap: PixelMap) => {
          this.image1 = pixelMap;
        });

      } else {
        const tempDir = getContext().cacheDir;
        const filePath = tempDir + '/temp_video.mp4';
        const file = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        fs.writeSync(file.fd, imageData);
        fs.closeSync(file);

        this.filePath = filePath;

      }

    }).catch((error: Error) => {
      console.error("loadImage2Local error:", error);
    });
  }

  build() {

    Column() {

      if ( this.item.isImage ) {
        Image(this.image1).width('100%').height(100).backgroundColor(Color.Grey)
      } else {
        Video({
          src: this.filePath, // 使用临时文件路径
          controller: this.videoController
        })
          .width('100%')
          .height(100)
          .autoPlay(true)

        // 添加控制按钮
        // Row() {
        //   Button('播放')
        //     .onClick(() => {
        //       this.videoController.start();
        //     })
        //   Button('暂停')
        //     .onClick(() => {
        //       this.videoController.pause();
        //     })
        // }

      }
    }

  }
}