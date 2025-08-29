
@Component
export struct MemoriesPage {
  @State message: string = '时刻';

  aboutToAppear(): void {
    console.log("MemoriesPage aboutToAppear");
  }

  aboutToDisappear(): void {
    console.log("MemoriesPage aboutToDisappear");
  }

  aboutToRecycle(): void {
    console.log("MemoriesPage aboutToRecycle");
  }

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('MemoriesPageHelloWorld')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          this.message = 'Welcome';
        })
    }
    .height('100%')
    .width('100%')
  }
}