// components/WearableForm.ets
@Component
export struct WearableForm {
  @BuilderParam content: () => void = this.defaultBuilder;

  onSubmit: () => void = () => {};
  onReset: () => void = () => {};

  @Builder defaultBuilder() {}

  build() {
    Scroll() {
      Column({ space: 10 }) {
        if (this.content) {
          this.content()
        }

        Row({ space: 8 }) {
          Button('Reset')
            .width('46%')
            .height(30)
            .backgroundColor('#262626')
            .fontColor('#FF4D4F')
            .onClick(() => this.onReset())

          Button('Submit')
            .width('46%')
            .height(30)
            .backgroundColor('#007DFF')
            .onClick(() => this.onSubmit())
        }
        .width('100%')
        .margin({ top: 12, bottom: 24 })
      }
      .width('100%')
      .padding({ left: 16, right: 16, bottom: 10 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
  }
}