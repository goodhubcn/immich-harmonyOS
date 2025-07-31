import { router } from '@kit.ArkUI';
import { BreakPointType } from '@ohos/common';
import * as CommonConstants from '../constants/CommonConstants';

/**
 * Grid component.
 */
@Component
export struct GridComponent {
  @StorageProp('mainBreakpoint') currentBreakpoint: string = CommonConstants.BREAKPOINTS_INITIALIZE_NAME;
  @State colTemplate: string = CommonConstants.INITIALIZE_TEMPLATE;
  private readonly data: number[] = [];

  aboutToAppear() {
    for (let i = 0; i < CommonConstants.GRID_SIZE; i++) {
      this.data.push(i);
    }
    switch (this.currentBreakpoint) {
      case CommonConstants.BREAKPOINTS_SM_NAME:
        this.colTemplate = CommonConstants.SM_COL_TEMPLATE;
        break;
      case CommonConstants.BREAKPOINTS_MD_NAME:
        this.colTemplate = CommonConstants.MD_COL_TEMPLATE;
        break;
      case CommonConstants.BREAKPOINTS_LG_NAME:
        this.colTemplate = CommonConstants.LG_COL_TEMPLATE;
        break;
      case CommonConstants.BREAKPOINTS_XL_NAME:
        this.colTemplate = CommonConstants.XL_COL_TEMPLATE;
        break;
      default:
        this.colTemplate = CommonConstants.SM_COL_TEMPLATE;
        break;
    }
  }

  build() {
    Column() {
      Row() {
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
      .width(CommonConstants.ROW_WIDTH)
      .height($r('app.float.arrow_item_height'))

      Grid() {
        ForEach(this.data, () => {
          GridItem() {
            Column() {
              Row()
                .width(CommonConstants.ROW_WIDTH)
                .aspectRatio(CommonConstants.COLUMN_ASPECT_RATIO)
                .backgroundColor($r('sys.color.ohos_id_color_component_normal'))
                .borderRadius($r('app.float.grid_row_border_radius'))

              Row() {
                Text($r('app.string.grid_title_label'))
                  .margin({ top: $r('app.float.grid_text_top') })
                  .fontSize($r('app.float.grid_text_font_size'))
                  .fontWeight(CommonConstants.COLUMN_TEXT_FONT_WEIGHT)
                  .fontColor($r('sys.color.ohos_id_color_text_primary'))
              }
              .padding({ left: $r('app.float.grid_text_padding_left') })
              .width(CommonConstants.ROW_WIDTH)
            }
          }
        }, (item: number, _index: number) => item.toString())
      }
      .columnsGap($r('app.float.grid_column_gap'))
      .rowsGap($r('app.float.grid_row_gap'))
      .columnsTemplate(this.colTemplate)
      .onAreaChange(() => {
        this.colTemplate = new BreakPointType({
          sm: CommonConstants.SM_COL_TEMPLATE,
          md: CommonConstants.MD_COL_TEMPLATE,
          lg: CommonConstants.LG_COL_TEMPLATE,
          xl: CommonConstants.XL_COL_TEMPLATE
        }).getValue(this.currentBreakpoint);
      })
      .margin({
        left: $r('app.float.grid_margin_left'),
        right: $r('app.float.grid_margin_right')
      })
      .padding({ bottom: $r('app.float.grid_padding_bottom') })
      .scrollBar(BarState.Off)
    }
  }
}