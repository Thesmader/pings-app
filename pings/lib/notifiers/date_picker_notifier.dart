import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pings/state/date_picker_state.dart';

/// Provides the state of PingsDatePicker.
final datePickerStateProvider = StateProvider<PingsDatePickerState>(
  (ref) => PingsDatePickerState(
    selectedDateTime: DateTime.now(),
  ),
);
