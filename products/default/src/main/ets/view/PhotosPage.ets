import { ControllerPhotosInterface } from "../Controller/ControllerPhotosInterface";
import { PhotosItemInterface } from "../viewmodel/PhotosItemInterface";

@Preview
@Component
export struct PhotosPage {

  statusBar: number = AppStorage.get<number>('statusBar') as number;

  @State message: string = '照片';
  // 用于控制当前显示哪个视图
  @State currentView: string = 'month'; // 默认显示月视图
  // 用于控制添加功能的弹窗是否显示（这里以弹窗为例）
  @State isAddDialogVisible: boolean = false;
  @State photos: PhotosItemInterface[] = [];

  private arr: number[] = [0, 1, 2];
  @State currentIndex: number = 0;


  controller: ControllerPhotosInterface = {
    onLoad: async (): Promise<PhotosItemInterface[]> => {
      console.log("PhotosPage controller onLoad");
      return [];
    },
    onNextLoad: async (): Promise<PhotosItemInterface[]> => {
      console.log("PhotosPage controller onNextLoad");
      return [];
    }
  };

  aboutToAppear(): void {
    console.log("PhotosPage aboutToAppear");

    this.controller.onLoad().then((data: PhotosItemInterface[]) => {

      console.log("PhotosPage onLoad data:", data);

      this.photos = data;

    });
  }

  aboutToDisappear(): void {
    console.log("PhotosPage aboutToDisappear");
  }

  aboutToRecycle(): void {
    console.log("PhotosPage aboutToRecycle");
  }

  onDidBuild(): void {
    console.log("PhotosPage onDidBuild");
  }
  @Builder
  NavigationTitle() {
    Column() {
      Text('Title')
        .fontColor('#182431')
        .fontSize(30)
        .lineHeight(41)
        .fontWeight(700)
      Text('subtitle')
        .fontColor('#182431')
        .fontSize(14)
        .lineHeight(19)
        .opacity(0.4)
        .margin({ top: 2, bottom: 20 })
    }.alignItems(HorizontalAlign.Start)
  }

  @Builder
  NavigationMenus() {
    Row() {

      Button() {
        Image('resources/base/media/add.svg')
          .width(48)
          .height(48)
          // .margin({ left: 8, top: 8, bottom: 8, right: 8 })
          // .margin({ top: 8 })
          .onClick(() => {

            console.log("Add menu clicked");
          })
      }.backgroundColor('#FFFFFF').margin({top: 5})


      Image('resources/base/media/add.svg')
        .width(40)
        .height(40)
        .margin({ left: 24 })
        .onClick(() => {

          console.log("Add menu clicked");
        })
      // Image('common/ic_public_more.svg')
      //   .width(24)
      //   .height(24)
      //   .margin({ left: 24 })
    }
  }

  build() {
    Column() {
      Navigation() {
        TextInput({ placeholder: 'search...' })
          .width('90%')
          .height(40)
          .backgroundColor('#FFFFFF')
          .margin({ top: 8 })

        List({ space: 12, initialIndex: 0 }) {
          ForEach(this.arr, (item: number) => {
            ListItem() {
              Text('' + item)
                .width('90%')
                .height(72)
                .backgroundColor('#FFFFFF')
                .borderRadius(24)
                .fontSize(16)
                .fontWeight(500)
                .textAlign(TextAlign.Center)
            }
          }, (item: number) => item.toString())
        }
        .height(324)
        .width('100%')
        .margin({ top: 12, left: '10%' })
      }
      .title(this.NavigationTitle)
      .menus(this.NavigationMenus)
      .mode(NavigationMode.Auto)
      // .titleMode(NavigationTitleMode.Free)
      .toolbarConfiguration([
        {
          value: "add",
          icon: $r("app.media.add"),
        },
        {
          value: "app",
          icon: $r("app.media.add")
        },
        {
          value: "collect",
          icon: $r("app.media.add")
        }
      ])
      .hideTitleBar(false)
      .hideToolBar(false)
      .hideBackButton(false)
      // .expandSafeArea([SafeAreaType.SYSTEM/*, SafeAreaType.CUTOUT, SafeAreaType.KEYBOARD*/])
      .onTitleModeChange((titleModel: NavigationTitleMode) => {
        console.info('titleMode' + titleModel)
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
    .padding({ top: this.statusBar });// 适配状态栏
  }
}