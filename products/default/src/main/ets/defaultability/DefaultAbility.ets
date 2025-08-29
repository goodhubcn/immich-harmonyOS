import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';

const DOMAIN = 0x0000;

export default class DefaultAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/ServerUrl', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
    });

    let windowClass: window.Window = windowStage.getMainWindowSync(); // Get the main window of the application
    // 1. Set the window to full screen
    let isLayoutFullScreen = false;
    windowClass.setWindowLayoutFullScreen(isLayoutFullScreen);
    // 2. Cache window object
    AppStorage.setOrCreate('windowClass', windowClass);

    // 3. Obtain layout to avoid obstructed areas
    let type = window.AvoidAreaType.TYPE_SYSTEM;
    let avoidArea = windowClass.getWindowAvoidArea(type);
    let statusBar =px2vp( avoidArea.topRect.height); // 获取状态栏的高度
    AppStorage.setOrCreate('statusBar', statusBar);

    console.log("statusBar height:", statusBar);

    windowStage.on('windowStageEvent', (data) => {
      let event: window.WindowStageEventType = data;

      switch (event) {
        case window.WindowStageEventType.SHOWN:
          hilog.info(DOMAIN, 'testTag', "on shown.");
          break;
        case window.WindowStageEventType.ACTIVE:
          hilog.info(DOMAIN, 'testTag', "on active");
          break;
        case window.WindowStageEventType.INACTIVE:
          hilog.info(DOMAIN, 'testTag', "on inactive");
          break;
        case window.WindowStageEventType.HIDDEN:
          hilog.info(DOMAIN, 'testTag', "on hidden");
          break;
        case window.WindowStageEventType.RESUMED:
          hilog.info(DOMAIN, 'testTag', "on resumed");
          break;
        case window.WindowStageEventType.PAUSED:
          hilog.info(DOMAIN, 'testTag', "on paused");
          break;
        default :
          break;
      }
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onBackground');
  }
}