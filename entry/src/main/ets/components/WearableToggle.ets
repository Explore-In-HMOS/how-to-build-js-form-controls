@Component
export struct WearableToggle {
  label: string = 'Share GPS Track';
  @Prop isOn: boolean = false;
  onToggleChange: (isOn: boolean) => void = () => {};

  build() {
    Row() {
      Text(this.label)
        .fontSize(13)
        .fontColor('#999999')

      Toggle({ type: ToggleType.Switch, isOn: this.isOn })
        .selectedColor('#007DFF')
        .switchPointColor('#FFFFFF')
        .onChange((isOn: boolean) => {
          this.onToggleChange(isOn);
        })
    }
    .width('100%')
    .height(44)
    .padding({ left: 16, right: 12 })
    .backgroundColor('#1A1A1A')
    .borderRadius(22)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}