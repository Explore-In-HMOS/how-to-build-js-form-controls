@Component
export struct WearableRating {
  @Prop rating: number = 0;

  onRatingChange: (rating: number) => void = () => {};

  build() {
    Column() {
      Text('Rate Session')
        .fontSize(13)
        .fontColor('#999999')
        .margin({ bottom: 4 })

      Rating({ rating: this.rating, indicator: false })
        .stars(5)
        .stepSize(0.5)
        .onChange((value: number) => {
          this.rating = value;
          this.onRatingChange(value);
        })

      Text(this.rating > 0 ? `${this.rating} / 5.0` : 'Tap stars to rate')
        .fontSize(11)
        .fontColor(this.rating > 0 ? '#007DFF' : '#666666')
        .margin({ top: 4 })
    }
    .width('100%')
    .padding(12)
    .backgroundColor('#1A1A1A')
    .borderRadius(20)
    .alignItems(HorizontalAlign.Center)
  }
}