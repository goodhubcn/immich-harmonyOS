import { ServerURLComponent } from "../view/ServerURLComponent";
import { router } from "@kit.ArkUI";

@Entry
@Component
struct Login {
  @State message: string = 'Hello World';

  aboutToAppear(): void {
    console.log('Login page about to appear');
  }

  aboutToDisappear(): void {
    console.log('Login page about to disappear');
  }

  build() {
    RelativeContainer() {
      ServerURLComponent({
        callback: (url: string) => {
          router.pushUrl({
            url: 'pages/Login',
            params: { serverUrl: url }
          });
        }
      })
    }
    .height('100%')
    .width('100%')
  }
}