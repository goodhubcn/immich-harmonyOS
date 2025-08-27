import * as CommonConstants from '../constants/CommonConstants';
import { router } from '@kit.ArkUI';

@Preview
@Component
export struct LoginComponent {
  @State username: string = ''
  @State password: string = ''
  serverUrl: string = ''
  callback: (email: string, pass: string) => void = (email: string, pass: string) => {
    console.log(`Logging in with email: ${email} and password: ${pass}`);
  }

  build() {
    Scroll() {
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
          // .margin({ left: $r('app.float.arrow_margin_left') })
          .backgroundColor($r('sys.color.ohos_id_color_button_normal'))
        }
        .width(CommonConstants.ADAPTIVE_COLUMN_WIDTH)
        .height($r('app.float.arrow_item_height'))
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Start)

        Column() {

          // 标题部分
          Text('登录')
            .fontSize(24)
            .margin({ bottom: 40 })
          Text(this.serverUrl)
            .fontSize(24)
            .margin({ bottom: 40 })

          // 用户名输入框
          TextInput({ placeholder: '邮箱' })
            .width('100%')
            .height(40)
            .type(InputType.Email)
            .placeholderColor(Color.Gray)
            .onChange((value: string) => {
              this.username = value
            })
            .margin({ bottom: 20 })
            .padding(8)
            .borderRadius(8)
            .borderWidth(1)
            .borderColor(Color.Black)

          // 密码输入框
          TextInput({ placeholder: '密码' })
            .width('100%')
            .height(40)
            .type(InputType.Password)
            .placeholderColor(Color.Gray)
            .onChange((value: string) => {
              this.password = value
            })
            .margin({ bottom: 20 })
            .padding(8)
            .borderRadius(8)
            .borderWidth(1)
            .borderColor(Color.Black)

          // 登录按钮
          Button('登录')
            .width('100%')
            .height(40)
            .backgroundColor('#007AFF')
            .onClick(() => {
              // 登录逻辑
              this.callback(this.username, this.password)
              // router.pushUrl({
              //   url: 'pages/HomePage'
              // })
            })
        }
      }
    }
    .padding(20)
    .width('100%')
    .height('100%')

  }
}