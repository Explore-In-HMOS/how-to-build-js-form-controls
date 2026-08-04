import { PromptAction, UIContext } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[WorkoutViewModel]';
const DOMAIN: number = 0xFF00;

@Observed
export class WorkoutViewModel {
  @Track public ratingVal: number = 0;
  @Track public searchQuery: string = '';
  @Track public selectedType: string = 'Running';
  @Track public selectedTime: string = '10:00';
  @Track public notesVal: string = '';
  @Track public shareGps: boolean = false;

  @Track public availableTypes: string[] = ['Running', 'Cycling', 'Swimming', 'Walking', 'Yoga'];

  private uiContext: UIContext | null = null;

  public setUIContext(uiContext: UIContext): void {
    this.uiContext = uiContext;
  }

  public showToast(messageText: string): void {
    if (!this.uiContext) {
      console.error(`${TAG} UIContext is not initialized!`);
      return;
    }

    try {
      let promptAction: PromptAction = this.uiContext.getPromptAction();
      promptAction.showToast({
        message: messageText,
        duration: 2000
      });
    } catch (error) {
      let message = (error as BusinessError).message;
      let code = (error as BusinessError).code;
      hilog.error(DOMAIN, TAG, '%{public}s', `showToast args error code is ${code}, message is ${message}`);
    }
  }

  public resetForm(): void {
    this.ratingVal = 0;
    this.searchQuery = '';
    this.selectedType = 'Running';
    this.selectedTime = '10:00';
    this.notesVal = '';
    this.shareGps = false;

    this.showToast('Form cleared.');
  }

  public submitForm(): void {
    if (this.ratingVal === 0) {
      this.showToast('Please rate your workout first!');
      return;
    }

    if (!this.uiContext) {
      console.error(`${TAG} UIContext is not initialized!`);
      return;
    }

    let summary =
      `Activity: ${this.selectedType}\n` +
        `Rating: ${this.ratingVal} / 5★\n` +
        `Time: ${this.selectedTime}\n` +
        `Drill Search: ${this.searchQuery || 'None'}\n` +
        `GPS Sharing: ${this.shareGps ? 'ON' : 'OFF'}\n` +
        `Notes: ${this.notesVal || 'None'}`;

    try {
      let promptAction: PromptAction = this.uiContext.getPromptAction();
      promptAction.showDialog({
        title: 'Workout Log Summary',
        message: summary,
        buttons: [
          {
            text: 'OK',
            color: '#007DFF'
          }
        ]
      }, (err, data) => {
        if (err) {
          console.error(`${TAG} showDialog err: ${JSON.stringify(err)}`);
          return;
        }
        console.info(`${TAG} showDialog success callback, click button index: ${data.index}`);
      });
    } catch (error) {
      let message = (error as BusinessError).message;
      let code = (error as BusinessError).code;
      console.error(`${TAG} showDialog args error code is ${code}, message is ${message}`);
    }
  }
}