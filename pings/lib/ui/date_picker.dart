import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pings/notifiers/date_picker_notifier.dart';
import 'package:pings/state/date_picker_state.dart';

/// Customised date picker widget for Pings.
class PingsDatePicker extends ConsumerWidget {
  /// Constructor for PingsDatePicker.
  const PingsDatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(datePickerStateProvider).state;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 22.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CloseButton(),
              Text(
                'Custom Date',
                style: GoogleFonts.ubuntu(
                  height: 1.15,
                  fontSize: 18.0,
                ),
              ),
              CupertinoSwitch(
                activeColor: const Color(0xFF52FFC1),
                onChanged: (value) {
                  context.read(datePickerStateProvider).state =
                      PingsDatePickerState(
                    selectedDateTime: state.selectedDateTime,
                    switchValue: value,
                  );
                },
                value: state.switchValue,
              )
            ],
          ),
          CalendarCarousel(
            onDayPressed: (selectedDateTime, events) {
              context.read(datePickerStateProvider).state =
                  PingsDatePickerState(
                      selectedDateTime: selectedDateTime,
                      switchValue: state.switchValue);
            },
            height: 380,
            showOnlyCurrentMonthDate: true,
            headerTextStyle: GoogleFonts.ubuntu(
              color: const Color(0xFF131313),
              fontSize: 24.0,
              height: 1.16,
            ),
            headerMargin:
                const EdgeInsets.only(left: 50, right: 50, bottom: 21, top: 39),
            weekdayTextStyle: GoogleFonts.ubuntu(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF989898),
            ),
            todayButtonColor: Colors.transparent,
            todayTextStyle: GoogleFonts.ubuntu(
                color: const Color(0xFFFF2323),
                fontWeight: FontWeight.w700,
                fontSize: 20),
            leftButtonIcon: const Icon(Icons.keyboard_arrow_left,
                size: 28.0, color: Colors.black),
            rightButtonIcon: const Icon(Icons.keyboard_arrow_right,
                size: 28.0, color: Colors.black),
            daysTextStyle: GoogleFonts.ubuntu(
              color: const Color(0xFF424242),
              fontSize: 20,
            ),
            weekendTextStyle: GoogleFonts.ubuntu(
              color: const Color(0xFF424242),
              fontSize: 20,
            ),
            selectedDayButtonColor: const Color(0xFFEBEBEB),
            firstDayOfWeek: 1,
            selectedDateTime: state.selectedDateTime,
          ),
        ],
      ),
    );
  }
}
