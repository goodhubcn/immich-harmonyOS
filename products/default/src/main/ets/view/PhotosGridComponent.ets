import { ControllerPhotosInterface } from "../Controller/ControllerPhotosInterface";
import { RCPUtils } from "../network/RCPUtils";
import { PhotosItemInterface } from "../viewmodel/PhotosItemInterface";

@Component
export struct PhotosGridComponent {
  // @State data: PhotosItemInterface[] = [];
  private startIndex: number = 0;
  private endIndex: number = 12;
  scroller: Scroller = new Scroller()

  controller?: ControllerPhotosInterface;
  data: PhotosItemInterface[] = [];

  build() {
    Column({ space: 5 }) {

      Scroll(this.scroller) {

        GridRow({
          columns: 12,
          gutter: 5,
          // onBreakpointChange: (breakpoint: string) => {
          //   console.log(breakpoint);
          // }
        }) {
          ForEach(this.data, (item: PhotosItemInterface) => {

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

                Image(item.assetUrl).width('100%').height(100).backgroundColor(Color.Grey)

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
        console.log(JSON.stringify(this.data))
      })
      .scrollable(ScrollDirection.Vertical)
      // .edgeEffect(EdgeEffect.Spring)
      .scrollSnap({snapAlign:ScrollSnapAlign.START, snapPagination:400, enableSnapToStart:true, enableSnapToEnd:true})
      .onScrollStop(() => {
        console.info('Scroll Stop')
        console.log(JSON.stringify(this.data))
      })

    }.width('100%').height('100%')
  }
}
