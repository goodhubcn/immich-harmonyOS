import { CatalogueListComponent } from '../view/CatalogueListComponent';
import CatalogueViewModel from '../viewmodel/CatalogueViewModel';

import * as CommonConstants from '../constants/CommonConstants';

import { router } from '@kit.ArkUI';

/**
 * Index is the entry of application and Here is a list showing three buttons,
 * click the button to jump to different pages.
 */
@Entry
@Component
struct Index {
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
        CatalogueListComponent({ catalogue: CatalogueViewModel.getCatalogueData() })
      }
      .backgroundColor($r('sys.color.ohos_id_color_sub_background'))
    }
  }
}