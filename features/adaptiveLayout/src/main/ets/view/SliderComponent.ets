import * as CommonConstants from '../constants/CommonConstants';

const CONTAINER_WIDTH = 55;

@Component
export struct SliderComponent {
  @LocalStorageLink('containerWidth') containerWidth: number = CONTAINER_WIDTH;

  build() {
    Slider({
      value: this.containerWidth,
      min: CommonConstants.SLIDER_MIN,
      max: CommonConstants.SLIDER_MAX
    })
      .width($r('app.float.slider_width'))
      .onChange((value: number) => {
        this.containerWidth = value;
      })
  }
}

