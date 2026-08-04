@Component
export struct WearableTextArea {
  @Prop textVal: string = '';
  placeholder: string = 'Add performance notes...';
  onTextChange: (text: string) => void = () => {
  };

  build() {
    Column({ space: 4 }) {
      Text('Notes')
        .fontSize(13)
        .fontColor('#999999')
        .alignSelf(ItemAlign.Start)
        .margin({ left: 4 })

      TextArea({ placeholder: this.placeholder, text: this.textVal })
        .height(80)
        .maxLength(150)
        .backgroundColor('#1A1A1A')
        .fontColor(Color.White)
        .placeholderColor('#666666')
        .fontSize(13)
        .placeholderFont({ size: 13 })
        .borderRadius(16)
        .onChange((val: string) => {
          this.onTextChange(val);
        })
    }
    .width('100%')
  }
}