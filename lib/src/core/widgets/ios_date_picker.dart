import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosDatePicker extends StatelessWidget {
  const IosDatePicker({
    super.key,
    this.timePicker = false,
    this.initialDateTime,
    required this.onDateTimeChanged,
  });

  final bool timePicker;
  final DateTime? initialDateTime;
  final void Function(DateTime) onDateTimeChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(8),
        ),
      ),
      child: CupertinoTheme(
        data: CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
            dateTimePickerTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'w600',
            ),
          ),
        ),
        child: CupertinoDatePicker(
          onDateTimeChanged: onDateTimeChanged,
          initialDateTime: initialDateTime,
          mode: timePicker
              ? CupertinoDatePickerMode.time
              : CupertinoDatePickerMode.date,
          use24hFormat: true,
          minimumYear: 1950,
          maximumYear: DateTime.now().year + 1,
        ),
      ),
    );
  }
}
