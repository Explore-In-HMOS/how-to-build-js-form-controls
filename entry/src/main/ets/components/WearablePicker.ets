@Component
export struct WearablePicker {
  @Prop selectedTime: string = '10:00';
  onTimeChange: (time: string) => void = () => {};

  build() {
    Column({ space: 4 }) {
      Text('Select Time')
        .fontSize(13)
        .fontColor('#999999')
        .alignSelf(ItemAlign.Start)
        .margin({ left: 4 })

      TimePicker({
        selected: new Date(`2026-01-01T${this.selectedTime}:00`)
      })
        .height(80)
        .useMilitaryTime(true)
        .backgroundColor('#1A1A1A')
        .borderRadius(16)
        .onChange((value: TimePickerResult) => {
          let hourStr = value.hour < 10 ? `0${value.hour}` : `${value.hour}`;
          let minStr = value.minute < 10 ? `0${value.minute}` : `${value.minute}`;
          let formattedTime = `${hourStr}:${minStr}`;
          this.onTimeChange(formattedTime);
        })
    }
    .width('100%')
  }
}