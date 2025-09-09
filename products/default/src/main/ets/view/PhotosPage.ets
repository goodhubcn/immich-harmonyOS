import { ControllerPhotosInterface } from "../Controller/ControllerPhotosInterface";
import { PhotosItemInterface } from "../viewmodel/PhotosItemInterface";
import { PhotosGridComponent } from "./PhotosGridComponent";

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

  @State currentIndex: number = 0;

  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];

  private tooTmp: ToolbarItem = {'value': "func", 'icon': "./image/ic_public_highlights.svg", 'action': ()=> {}};
  private tooBar: ToolbarItem[] = [this.tooTmp, this.tooTmp, this.tooTmp];

  controller: ControllerPhotosInterface = {} as ControllerPhotosInterface;

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

      Button({ type: ButtonType.Circle, stateEffect: true }) {
        Image($r('app.media.add'))
          .width(40)
          .height(40)
          // .margin({ left: 8, top: 8, bottom: 8, right: 8 })
          // .margin({ top: 8 })
          // .onClick(() => {
          //
          //   console.log("Add menu clicked");
          // })
      }
      .width(48)
      .height(48)
      .backgroundColor('#FFFFFF')
      .margin({top: 5})
      .onClick(() => {
        console.log("Add menu clicked");
        this.isAddDialogVisible = true;
      })

      // let MarLeft: Record<string, number> = { 'left': 20 }
      // Button({ type: ButtonType.Circle, stateEffect: true }) {
      //   Image($r('app.media.ic_public_delete_filled')).width(30).height(30)
      // }.width(55).height(55).margin(MarLeft).backgroundColor(0xF55A42)


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

        PhotosGridComponent({data: this.photos, controller: this.controller})

        // TextInput({ placeholder: 'search...' })
        //   .width('90%')
        //   .height(40)
        //   .backgroundColor('#FFFFFF')
        //   .margin({ top: 8 })
        //
        // List({ space: 12, initialIndex: 0 }) {
        //   ForEach(this.arr, (item: number) => {
        //     ListItem() {
        //       Text('' + item)
        //         .width('90%')
        //         .height(72)
        //         .backgroundColor('#FFFFFF')
        //         .borderRadius(24)
        //         .fontSize(16)
        //         .fontWeight(500)
        //         .textAlign(TextAlign.Center)
        //     }
        //   }, (item: number) => item.toString())
        // }
        // .height('100%')
        // .width('100%')
        // .margin({ top: 12, left: '10%' })
      }
      // .title(this.NavigationTitle)
      // .menus(this.NavigationMenus)
      .menus([{
        value: "search", icon: $r("app.media.magnifyingglass"), action: () => {
          console.log("Add menu clicked");
          this.isAddDialogVisible = true;
        }
        },
        {
          value: "add", icon: $r("app.media.plus"), action: () => {
          console.log("Add menu clicked");
          this.isAddDialogVisible = true;
        }
        },
        {
          value: "more", icon: $r("app.media.more"), action: () => {
          console.log("More menu clicked");
        }
        }])
      .mode(NavigationMode.Auto)
      // .titleMode(NavigationTitleMode.Free)
      // .toolbarConfiguration(this.tooBar)
      .hideTitleBar(false)
      .hideToolBar(false)
      .hideBackButton(false)
      // .expandSafeArea([SafeAreaType.SYSTEM/*, SafeAreaType.CUTOUT, SafeAreaType.KEYBOARD*/])
      .onTitleModeChange((titleModel: NavigationTitleMode) => {
        console.info('titleMode' + titleModel)
      })
      .onNavBarStateChange((isCollapsed: boolean) => {
        console.info('isCollapsed' + isCollapsed)
      })
    }
    .width('100%')
    .height('100%')
    // .backgroundColor('#F1F3F5')
    .backgroundColor('#FFFFFF')
    .padding({ top: this.statusBar});// 适配状态栏
  }
}