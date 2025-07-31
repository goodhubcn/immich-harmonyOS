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

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
    });

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