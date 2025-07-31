import { router } from '@kit.ArkUI';
import { AdaptiveLayout } from '@ohos/adaptivelayout';
import * as CommonConstants from '../constants/CommonConstants';

/**
 * AdaptiveIndex is the entry of the adaptive layout pages.
 */
@Entry
@Component
struct AdaptiveIndex {
  build() {
    Column() {
      Column() {
        Stack() {
          SymbolGlyph($r('sys.symbol.chevron_left'))
            .fontSize($r('app.float.arrow_width'))
            .onClick(() => {
              router.back();
            })
            .fontColor([$r('sys.color.titlebar_icon_color')])
        }
        .width($r('app.float.arrow_width'))
        .borderRadius($r('app.float.arrow_left_borderRadius'))
        .margin({ left: $r('app.float.arrow_margin_left') })
        .backgroundColor($r('sys.color.ohos_id_color_button_normal'))
      }
      .width(CommonConstants.ADAPTIVE_COLUMN_WIDTH)
      .height($r('app.float.arrow_item_height'))
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Start)

      Column() {
        AdaptiveLayout()
      }
      .width(CommonConstants.ADAPTIVE_FLEXIBLE_COLUMN_WIDTH)
      .justifyContent(FlexAlign.Center)
      .flexShrink(CommonConstants.ADAPTIVE_FLEX_SHRINK)
    }
    .height(CommonConstants.ADAPTIVE_COLUMN_HEIGHT)
    .backgroundColor($r('sys.color.ohos_id_color_sub_background'))
  }
}