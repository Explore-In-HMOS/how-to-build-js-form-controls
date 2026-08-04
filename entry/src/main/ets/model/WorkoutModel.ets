export class WorkoutFeedback {
  public rating: number;
  public notes: string;
  public workoutType: string;
  public dateTime: Date;
  public shareGPS: boolean;

  constructor() {
    this.rating = 0;
    this.notes = '';
    this.workoutType = 'Running';
    this.dateTime = new Date();
    this.shareGPS = false;
  }
}