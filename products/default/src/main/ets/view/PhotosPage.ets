import { ControllerPhotosInterface } from "../controller/ControllerPhotosInterface";
import { PhotosItemInterface } from "../viewmodel/PhotosItemInterface";
import { ImageComponent } from "./ImageComponent";
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

  scroller: Scroller = new Scroller()

  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];

  private tooTmp: ToolbarItem = {'value': "func", 'icon': "./image/ic_public_highlights.svg", 'action': ()=> {}};
  private tooBar: ToolbarItem[] = [this.tooTmp, this.tooTmp, this.tooTmp];

  controller?: ControllerPhotosInterface;

  aboutToAppear(): void {
    console.log("PhotosPage aboutToAppear");

    this.controller?.onLoad().then((data: PhotosItemInterface[]) => {

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

        // PhotosGridComponent({data: this.photos, controller: this.controller})

        Column({ space: 5 }) {

          Scroll(this.scroller) {

            GridRow({
              columns: 12,
              gutter: 5,
              // onBreakpointChange: (breakpoint: string) => {
              //   console.log(breakpoint);
              // }
            }) {
              ForEach(this.photos, (item: PhotosItemInterface) => {

                // xs: 2, // 在最小宽度类型设备上，栅格子组件占据的栅格容器2列。
                // sm: 3, // 在小宽度类型设备上，栅格子组件占据的栅格容器3列。
                // md: 4, // 在中等宽度类型设备上，栅格子组件占据的栅格容器4列。
                // lg: 6, // 在大宽度类型设备上，栅格子组件占据的栅格容器6列。
                // xl: 8, // 在特大宽度类型设备上，栅格子组件占据的栅格容器8列。
                // xxl: 12 // 在超大宽度类型设备上，栅格子组件占据的栅格容器12

                GridCol({ span: { xs: 2, sm: 4, md: 4, lg: 6 } }) {
                  Row() {
                    // Text(item.toString())
                    //   .fontSize(12)
                    //   .fontWeight(400)
                    //   .fontColor(Color.Black)
                    //   .textAlign(TextAlign.Center)
                    //   .width('100%')
                    //   .height('100%')

                    // Image(item.assetUrl).width('100%').height(100).backgroundColor(Color.Grey)

                    ImageComponent({item: item, controller: this.controller})

                  }.width('100%').height(100).backgroundColor(Color.Grey)
                }
              })
            }.margin({ top: 5 })
            .onBreakpointChange((breakpoint: string) => {
              console.log(breakpoint);
            })
            .onAreaChange((oldValue: Area, newValue: Area) => {
              console.log("onAreaChange, oldValue: " + oldValue + ", newValue: " + newValue);
            })
          }
          .backgroundColor(Color.White)
          .height('100%')
          .onReachEnd(() => {
            console.info('Reach End')
            // console.log(JSON.stringify(this.photos))

            this.controller?.onNextLoad().then((data: PhotosItemInterface[]) => {
              console.log("PhotosPage onNextLoad data:", data);
              this.photos = data;
            });

          })
          .scrollable(ScrollDirection.Vertical)
          // .edgeEffect(EdgeEffect.Spring)
          .scrollSnap({snapAlign:ScrollSnapAlign.START, snapPagination:400, enableSnapToStart:true, enableSnapToEnd:true})
          .onScrollStop(() => {
            console.info('Scroll Stop')
            console.log(JSON.stringify(this.photos))
          })

        }.width('100%').height('100%')

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