/// State class for PingsDatePicker.
class PingsDatePickerState {
  /// Constructor for PingsDatePickerState.
  const PingsDatePickerState({
    this.switchValue = true,
    required this.selectedDateTime,
  });

  /// Holds the state of the switch in the datepicker dialog.
  final bool switchValue;

  /// Holds the selected time of the datepicker.
  final DateTime selectedDateTime;
}
