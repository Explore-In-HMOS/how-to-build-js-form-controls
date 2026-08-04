@Component
export struct WearableSearch {
  @Prop query: string = '';
  @Prop suggestions: string[] = [];
  onQueryChange: (text: string) => void = () => {};
  onSelectSuggestion: (text: string) => void = () => {};

  build() {
    Column({ space: 4 }) {
      Search({ value: this.query, placeholder: 'Search drill...' })
        .height(40)
        .backgroundColor('#1A1A1A')
        .placeholderColor('#555555')
        .textFont({ size: 13 })
        .onSubmit((text: string) => this.onQueryChange(text))
        .onChange((text: string) => this.onQueryChange(text))

      if (this.suggestions.length > 0) {
        List({ space: 4 }) {
          ForEach(this.suggestions, (item: string) => {
            ListItem() {
              Text(item)
                .fontSize(12)
                .fontColor('#007DFF')
                .padding(8)
                .width('100%')
                .onClick(() => this.onSelectSuggestion(item))
            }
            .backgroundColor('#262626')
            .borderRadius(6)
          }, (item: string) => item)
        }
        .width('90%')
        .height(60)
      }
    }
    .width('100%')
  }
}