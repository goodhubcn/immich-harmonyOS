import { LoginComponent } from "../view/LoginComponent";
import { router } from "@kit.ArkUI";
import { Authentication } from "../server/Authentication";
import { AuthenticationImpl } from "../server/AuthenticationImpl";
import { RCPUtils } from "../network/RCPUtils";
import { TimelineImpl } from "../server/TimelineImpl";

interface UrlParamsInterface {
  serverUrl?: string;
}

@Entry
@Component
struct ServerUrl {
  @State message: string = 'Hello World';
  @State url: string =
    (router.getParams() as UrlParamsInterface).serverUrl as string; // 从路由参数中获取服务器地址，若不存在则赋值为空字符串

  async login(email: string, pass: string): Promise<void> {
    console.log(`Logging in with email: ${email} and password: ${pass}`);

    let baseUrl = "https://immich.goodhub.cn";//AppStorage.get<string>('serverUrl') as string;

    let authentication: Authentication = new AuthenticationImpl(RCPUtils.getInstance());

    await authentication.login(email, pass).then((response) => {
      // console.log(`Login response: ${JSON.stringify(response)}`);
      // LoginResponseInterface
      if (response.accessToken) {
        // 保存登录信息到本地存储
        AppStorage.setOrCreate('accessToken', response.accessToken);
        AppStorage.setOrCreate('userId', response.userId);
        AppStorage.setOrCreate('userEmail', response.userEmail);
        AppStorage.setOrCreate('userName', response.name);
        AppStorage.setOrCreate('isAdmin', response.isAdmin);
        AppStorage.setOrCreate('profileImagePath', response.profileImagePath);
        AppStorage.setOrCreate('isOnboarded', response.isOnboarded);
        AppStorage.setOrCreate('serverUrl', this.url);

        // 跳转到首页
        router.pushUrl({
          url: 'pages/HomePage',
          params: {userInfo: response}
        });

      } else {
        console.error('Login failed: No access token received');
      }
    }).catch((error: Error) => {
      console.error(`Login error: ${error.message}`);
    });

    return;
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