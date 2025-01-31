import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../config/app_colors.dart';

class TxtField extends StatelessWidget {
  const TxtField({
    super.key,
    required this.controller,
    required this.hintText,
    this.number = false,
    // this.multiline = false,
    // this.datePicker = false,
    // this.timePicker = false,
    this.length = 20,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final bool number;
  // final bool multiline;
  // final bool datePicker;
  // final bool timePicker;
  final int length;
  final void Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        keyboardType: number ? TextInputType.number : null,
        // readOnly: true, // if date picker
        inputFormatters: [
          LengthLimitingTextInputFormatter(length),
          if (number) FilteringTextInputFormatter.digitsOnly,
        ],
        textCapitalization: TextCapitalization.sentences,
        style: TextStyle(
          color: AppColors.white,
          fontFamily: 'w600',
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 16,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.white.withValues(alpha: 0.5),
            fontFamily: 'w600',
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onChanged: (value) {
          onChanged();
        },
      ),
    );
  }
}

        // void onDateTimeChanged(DateTime date) {
        //   setState(() {
        //     widget.controller.text = dateToString(date);
        //   });
        //   widget.onChanged();
        // }

        // void onTimeChanged(DateTime date) {
        //   setState(() {
        //     widget.controller.text = timeToString(date);
        //   });
        //   widget.onChanged();
        // }

        // onTap: () async {
        //   if (widget.datePicker) {
        //     await showCupertinoModalPopup(
        //       context: context,
        //       builder: (context) {
        //         return Container(
        //           height: 240,
        //           decoration: BoxDecoration(
        //             color: Colors.white.withOpacity(0.5),
        //             borderRadius: const BorderRadius.vertical(
        //               top: Radius.circular(8),
        //             ),
        //           ),
        //           child: CupertinoTheme(
        //             data: cupertinoTheme,
        //             child: CupertinoDatePicker(
        //               onDateTimeChanged: onDateTimeChanged,
        //               initialDateTime: stringToDate(widget.controller.text),
        //               mode: CupertinoDatePickerMode.date,
        //               minimumYear: 1950,
        //               maximumYear: DateTime.now().year + 1,
        //             ),
        //           ),
        //         );
        //       },
        //     );
        //   } else if (widget.timePicker) {
        //     await showCupertinoModalPopup(
        //       context: context,
        //       builder: (context) {
        //         return Container(
        //           height: 240,
        //           decoration: BoxDecoration(
        //             color: Colors.white.withOpacity(0.5),
        //             borderRadius: const BorderRadius.vertical(
        //               top: Radius.circular(8),
        //             ),
        //           ),
        //           child: CupertinoTheme(
        //             data: cupertinoTheme,
        //             child: CupertinoDatePicker(
        //               onDateTimeChanged: onTimeChanged,
        //               initialDateTime: stringToDate(widget.controller.text),
        //               mode: CupertinoDatePickerMode.time,
        //               use24hFormat: true,
        //             ),
        //           ),
        //         );
        //       },
        //     );
        //   }
        // },

// 1
//  date_picker_plus: ^4.1.0
// 2
//  readOnly: true,
// 3
// onTap: () async {
//     final date = await showDatePickerDialog(
//         context: context,
//         leadingDateTextStyle: const TextStyle(
//           color: AppColors.purple1,
//           fontWeight: FontWeight.w700,
//           fontFamily: 'InterB',
//         ),
//         enabledCellsTextStyle: const TextStyle(
//           color: AppColors.black,
//         ),
//         currentDateTextStyle: const TextStyle(
//           color: AppColors.white,
//         ),
//         currentDateDecoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(100),
//           color: const Color(0xffFB41FF),
//           // border: Border.all(color: const Color(0xffFB41FF)),
//         ),
//         disabledCellsTextStyle: const TextStyle(
//           color: AppColors.black,
//           fontSize: 12,
//           fontWeight: FontWeight.w500,
//           fontFamily: 'InterM',
//         ),
//         daysOfTheWeekTextStyle: const TextStyle(
//           color: Color(0xff3d3d40),
//           fontSize: 12,
//           fontWeight: FontWeight.w600,
//           fontFamily: 'InterM',
//         ),
//         splashColor: AppColors.pink1,
//         highlightColor: AppColors.pink1,
//         slidersColor: AppColors.purple1,
//         currentDate: controller.text.isEmpty
//             ? DateTime.now()
//             : convertToDateTime(controller.text),
//         minDate: DateTime(2020, 1, 1),
//         maxDate: DateTime(2030, 1, 1),
//         padding: EdgeInsets.zero,
//         contentPadding: const EdgeInsets.all(24),
//         height: 318,
//     );
//     if (date != null) {
//         onDate(formatDateTime(date));
//     }
// },
