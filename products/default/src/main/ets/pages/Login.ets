import { LoginComponent } from "../view/LoginComponent";
import { router } from "@kit.ArkUI";

interface UrlParamsInterface {
  serverUrl?: string;
}

@Entry
@Component
struct ServerUrl {
  @State message: string = 'Hello World';
  @State url: string =
    (router.getParams() as UrlParamsInterface).serverUrl as string; // 从路由参数中获取服务器地址，若不存在则赋值为空字符串

  login(email: string, pass: string): void {
    console.log(`Logging in with email: ${email} and password: ${pass}`);

    router.pushUrl({
      url: 'pages/Index'
    });
  }

  build() {
    RelativeContainer() {
      LoginComponent({
        callback: this.login,
        serverUrl: this.url
      })
    }
    .height('100%')
    .width('100%')
  }
}