@Component
export struct WearableSelect {
  @Prop selectedValue: string = '';
  @Prop options: string[] = [];
  onSelect: (val: string) => void = () => {};

  private getSelectOptions(): SelectOption[] {
    if (!this.options || this.options.length === 0) {
      return [];
    }
    let result: SelectOption[] = [];
    for (let i = 0; i < this.options.length; i++) {
      result.push({ value: this.options[i] });
    }
    return result;
  }

  build() {
    Row() {
      Text('Activity')
        .fontSize(13)
        .fontColor('#999999')

      Select(this.getSelectOptions())
        .selected(this.options.indexOf(this.selectedValue) >= 0 ? this.options.indexOf(this.selectedValue) : 0)
        .value(this.selectedValue)
        .font({ size: 13, weight: FontWeight.Medium })
        .fontColor(Color.White)
        .backgroundColor(Color.Transparent)
        .onSelect((index: number, text: string) => {
          this.onSelect(text);
        })
    }
    .width('100%')
    .height(48)
    .backgroundColor('#1A1A1A')
    .borderRadius(24)
    .padding({ left: 16, right: 8 })
    .justifyContent(FlexAlign.SpaceBetween)
  }
}