
import * as CommonConstants from '../constants/CommonConstants';
import { router } from '@kit.ArkUI';
import { PhotosPage } from '../view/PhotosPage';
import { AlbumsPage } from '../view/AlbumsPage';
import { MemoriesPage } from '../view/MemoriesPage';
import { ControllerPhotosImpl } from '../Controller/ControllerPhotosImpl';
import { RCPUtils } from '../network/RCPUtils';
import { TimelineImpl } from '../server/TimelineImpl';
import { rcp } from '@kit.RemoteCommunicationKit';
import { LoginResponseInterface } from '../viewmodel/LoginResponseInterface';
import { ControllerPhotosInterface } from '../Controller/ControllerPhotosInterface';

interface UserInfoInterface {
  userInfo?: LoginResponseInterface;
}

@Entry
@Component
struct HomePage {
  // statusBar: number = AppStorage.get<number>('statusBar') as number;
  @State userInfo: LoginResponseInterface =
    (router.getParams() as UserInfoInterface).userInfo as LoginResponseInterface;

  @State navList: Array<number> = [0, 1, 2];
  @State navTitle: Array<string> = ['照片', '相册', '时刻'];
  // @State containerList: Array<PhotosPage | AlbumsPage | MemoriesPage> = [PhotosPage(), AlbumsPage(), MemoriesPage()];

  @State active: number = 0;
  @State show: boolean = false;

  photosController: ControllerPhotosInterface = new ControllerPhotosImpl(this.userInfo);

  getBuckets(): void {

    // let token = this.userInfo.accessToken;
    //
    // this.photosController.getTimeBuckets(token).then((response) => {
    //   console.log(`getTimeBuckets response: ${JSON.stringify(response)}`);
    //
    //   // if (response.length > 0) {
    //   //   this.getBucket(response[0].timeBucket as string);
    //   // }
    //
    // }).catch((error: Error) => {
    //   console.error(`getTimeBuckets error: ${error.message}`);
    // });
    // let timeline = new TimelineImpl(RCPUtils.getInstance());
    //
    // console.log('accessToken: ' + this.userInfo.accessToken);
    //
    // timeline.getTimeBuckets().then((response) => {
    //   console.log(`getTimeBuckets response: ${JSON.stringify(response)}`);
    //
    //   this.getBucket(response[0].timeBucket as string);
    //
    // }).catch((error: Error) => {
    //   console.error(`getTimeBuckets error: ${error.message}`);
    //
    // });
  }

  // getBucket(timebucket: string): void {
  //
  //   let timeline = new TimelineImpl(RCPUtils.getInstance());
  //
  //   timeline.getTimeBucket(timebucket).then((response) => {
  //     console.log(`getTimeBucket response: ${JSON.stringify(response)}`);
  //
  //   }).catch((error: Error) => {
  //     console.error(`getTimeBucket error: ${error.message}`);
  //   });
  // }

  aboutToAppear(): void {
    router.clear();

    console.log("HomePage aboutToAppear");

    // this.getBuckets();
  }

  onPageShow(): void {
    console.log("HomePage onPageShow");
  }

  onPageHide(): void {
    console.log("HomePage onPageHide");
  }

  build() {
    // [Start Drawer_tab_side_bar_container]
    SideBarContainer(SideBarContainerType.Overlay) {
      // [Start Drawer_tab_side_bar_container_other]
      Column() {
        // [StartExclude Drawer_tab_side_bar_container]
        ForEach(this.navList, (item: number, index: number) => {
          Column() {
            Row() {

              Image(this.active === item ? $r('app.media.activeList') : $r('app.media.list'))
                .width(24)
                .height(24)

              Text(this.navTitle[index])
                .fontSize(16)
                .fontColor(Color.Black)
                .fontWeight(FontWeight.Medium)
                .margin({ left: 17 })

            }
            .height(48)
            .width('100%')

            if (this.navList.length - 1 !== index) {
              Row()
                .height(0.5)
                .backgroundColor('#0D000000')
                .width('90%')
            }
          }
          .onClick(() => {
            this.active = item;
            this.getUIContext().animateTo({
              duration: CommonConstants.ANIMATION_DURATION,
              curve: Curve.EaseOut,
              playMode: PlayMode.Normal,
            }, () => {
              this.show = false;
            })
          })
          .margin({
            top: 4,
            left: 4,
            right: 4,
            bottom: 4
          })
          .justifyContent(FlexAlign.Center)
          .width(264)
          .height(48)
          .padding({ left: 13 })
          .borderRadius(16)
          .backgroundColor(this.active === item ? '#1A0A59F7' : '')
        }, (item: number, index: number) => JSON.stringify(item) + index)

        // Row() {
        //   Image($r('app.media.add'))
        //     .width(40)
        //     .height(40)
        //   Text($r('app.string.add_list')).margin({ left: 8 })
        // }
        // .width('100%')
        // .margin({ top: 284 })
        // [EndExclude Drawer_tab_side_bar_container]
      }
      .height('100%')
      .padding({ top: 104 })
      .backgroundColor('#E9EAEC')
      .width(272)
      .height(344)
      .backgroundColor(Color.White)
      .borderRadius(20)
      // [End Drawer_tab_side_bar_container_other]
      Column() {
        // [StartExclude Drawer_tab_side_bar_container]
        if (this.active === 0) {

          PhotosPage({ controller: this.photosController })

        } else if (this.active === 1) {
          AlbumsPage()
        }else if (this.active === 2) {
          MemoriesPage()
        } else {
          Text("Error")
          .width('100%')
          .height('100%')
          .fontSize(30)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
        }
        // [EndExclude Drawer_tab_side_bar_container]
      }
      .onClick(() => {
        this.getUIContext().animateTo({
          duration: CommonConstants.ANIMATION_DURATION,
          curve: Curve.EaseOut,
          playMode: PlayMode.Normal,
        }, () => {
          this.show = false;
        })
      })
      .width('100%')
      .height('110%')
      .backgroundColor(this.show ? '#c1c2c4' : '')
    }
    .showSideBar(this.show)
    .controlButton({
      left: 16,
      top: 48,
      height: 40,
      width: 40,
      icons: {
        shown: $r('app.media.changeBack'),
        hidden: $r('app.media.change'),
        switching: $r('app.media.change')
      }
    })
    .onChange((value: boolean) => {
      this.show = value;
    })
    // [End Drawer_tab_side_bar_container]
    .sideBarWidth('85%')
    .minSideBarWidth('85%')
    .width('100%')
    .height('110%')
    .translate({ y: -40 })
  }
}

