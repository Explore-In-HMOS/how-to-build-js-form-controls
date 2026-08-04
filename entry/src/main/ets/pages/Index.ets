import { WorkoutViewModel } from '../viewmodel/WorkoutViewModel';
import { WearableForm } from '../components/WearableForm';
import { WearableRating } from '../components/WearableRating';
import { WearableSelect } from '../components/WearableSelect';
import { WearablePicker } from '../components/WearablePicker';
import { WearableTextArea } from '../components/WearableTextArea';
import { WearableToggle } from '../components/WearableToggle';

@Entry
@Component
struct Index {
  @State viewModel: WorkoutViewModel = new WorkoutViewModel();

  aboutToAppear(): void {
    this.viewModel.setUIContext(this.getUIContext());
  }

  build() {
    Column() {
      WearableForm({
        onSubmit: () => this.viewModel.submitForm(),
        onReset: () => this.viewModel.resetForm()
      }) {
        // --- CHILD ELEMENTS ---
        Text('WORKOUT LOG')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
          .margin({ top: 12, bottom: 4 })

        // 1. Rating
        WearableRating({
          rating: this.viewModel.ratingVal,
          onRatingChange: (val: number) => { this.viewModel.ratingVal = val; }
        })

        // 2. Search
        Search({ placeholder: 'Search drill...', value: this.viewModel.searchQuery })
          .height(40)
          .backgroundColor('#1A1A1A')
          .onChange((val: string) => { this.viewModel.searchQuery = val; })

        // 3. Select (Activity Type)
        WearableSelect({
          selectedValue: this.viewModel.selectedType,
          options: this.viewModel.availableTypes,
          onSelect: (val: string) => { this.viewModel.selectedType = val; }
        })

        // 4. Embedded TimePicker
        WearablePicker({
          selectedTime: this.viewModel.selectedTime,
          onTimeChange: (time: string) => { this.viewModel.selectedTime = time; }
        })

        // 5. TextArea (Notes)
        WearableTextArea({
          textVal: this.viewModel.notesVal,
          placeholder: 'Add performance notes...',
          onTextChange: (val: string) => { this.viewModel.notesVal = val; }
        })

        // 6. Toggle (GPS)
        WearableToggle({
          label: 'Share GPS Track',
          isOn: this.viewModel.shareGps,
          onToggleChange: (isOn: boolean) => { this.viewModel.shareGps = isOn; }
        })
      }
    }
    .width('100%')
    .height('100%')
  }
}