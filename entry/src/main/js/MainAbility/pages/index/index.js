import prompt from '@system.prompt';

export default {
  data: {
    ratingVal: 0,
    searchQuery: '',
    selectedType: 'Running',
    selectedTime: '10:00',
    notesVal: '',
    shareGps: false,
    stars: [1, 2, 3, 4, 5],
    availableTypes: ['Running', 'Cycling', 'Swimming', 'Walking', 'Yoga']
  },

  showToast(msg) {
    try {
      prompt.showToast({
        message: msg,
        duration: 2000
      });
    } catch (error) {
      console.error(`showToast Error: ${JSON.stringify(error)}`);
    }
  },

  onRatingSelect(index) {
    this.ratingVal = index + 1;
  },

  onSearchChange(e) {
    this.searchQuery = e.value;
  },

  onTypeSelect(e) {
    this.selectedType = e.newValue;
  },

  onTimeChange(e) {
    let hour = e.hour < 10 ? `0${e.hour}` : e.hour;
    let minute = e.minute < 10 ? `0${e.minute}` : e.minute;
    this.selectedTime = `${hour}:${minute}`;
  },

  onNotesChange(e) {
    this.notesVal = e.text;
  },

  onGpsToggle(e) {
    this.shareGps = e.checked;
  },

  resetForm() {
    this.ratingVal = 0;
    this.searchQuery = '';
    this.selectedType = 'Running';
    this.selectedTime = '10:00';
    this.notesVal = '';
    this.shareGps = false;

    this.showToast('Form cleared.');
  },

  submitForm() {
    if (this.ratingVal === 0) {
      this.showToast('Please rate your workout first!');
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
      prompt.showDialog({
        title: 'Workout Log Summary',
        message: summary,
        buttons: [
          { text: 'OK', color: '#007DFF' }
        ],
        success: (data) => {
          console.info(`Dialog click button index: ${data.index}`);
        },
        fail: (data, code) => {
          console.error(`showDialog fail code: ${code}, data: ${data}`);
        }
      });
    } catch (error) {
      console.error(`showDialog Error: ${JSON.stringify(error)}`);
    }
  }
};