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

          if (!url) {
            console.log('Server URL is empty');
            return;
          }

          PersistentStorage.persistProp('serverUrl', url);
          //AppStorage.setOrCreate('serverUrl', url);

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