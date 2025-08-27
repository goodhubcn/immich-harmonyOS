import { router } from "@kit.ArkUI"

@Preview
@Component
export struct ServerURLComponent {
  @State serverAddress: string = ''
  callback: (url: string) => void = (url: string) => {
  }

  build() {
    Scroll() {
      Column() {
        // 标题部分
        Text('immich服务器设置')
          .fontSize(24)
          .margin({ bottom: 40 })

        // 服务器地址输入框
        TextInput({ placeholder: '请输入服务器地址' })
          .width('100%')
          .height(40)
          .type(InputType.URL)
          .placeholderColor(Color.Gray)
          .onChange((value: string) => {
            this.serverAddress = value
          })
          .margin({ bottom: 20 })
          .padding(8)
          .borderRadius(8)
          .borderWidth(1)
          .borderColor(Color.Black)

        // 下一步按钮
        Button('下一步')
          .width('100%')
          .height(40)
          .backgroundColor('#007AFF')
          .onClick(() => {
            // 跳转登录页面逻辑
            this.callback(this.serverAddress)
            // router.pushUrl({
            //   url: 'pages/LoginPage'
            // })
          })
      }
    }
    .padding(20)
    .width('100%')
    .height('100%')
  }
}