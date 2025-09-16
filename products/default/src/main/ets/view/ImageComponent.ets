import { PhotosItemInterface } from "../viewmodel/PhotosItemInterface";
import { image } from "@kit.ImageKit";
import { ControllerPhotosInterface } from "../controller/ControllerPhotosInterface";

@Component
export struct ImageComponent {

  @State image: string = "";
  @State image1: PixelMap | undefined = undefined; //创建PixelMap状态变量。

  item: PhotosItemInterface = {} as PhotosItemInterface;
  controller?: ControllerPhotosInterface;

  aboutToAppear(): void {
    // let imageSource: image.ImageSource = image.createImageSource(this.item.assetUrl);

    this.controller?.loadImage2Local(this.item.assetUrl).then((imageData: ArrayBuffer) => {
      // console.log("loadImage2Local localPath:", localPath);
      // let imageUri = `file:/${localPath}`; // 构建完整的 file:// URI
      // this.image = imageUri;
      // TODO: this.item.isImage === false 显示视频缩略图

      let imageSource: image.ImageSource = image.createImageSource(imageData);
      let options: image.DecodingOptions = {
        'desiredPixelFormat': image.PixelMapFormat.RGBA_8888,
      };
      imageSource.createPixelMap(options).then((pixelMap: PixelMap) => {
        this.image1 = pixelMap;
      });


    }).catch((error: Error) => {
      console.error("loadImage2Local error:", error);
    });
  }

  build() {
    Image(this.image1).width('100%').height(100).backgroundColor(Color.Grey)
  }
}