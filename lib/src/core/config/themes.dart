import 'package:flutter/material.dart';

import 'constants.dart';

final theme = ThemeData(
  useMaterial3: false,
  fontFamily: 'w400',
  brightness: Brightness.dark,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.main,
    selectionColor: AppColors.main,
    selectionHandleColor: AppColors.main,
  ),
  // colorScheme: ColorScheme.fromSwatch(
  //   accentColor: AppColors.main, // overscroll indicator color
  // ),

  // DIALOG
  dialogTheme: const DialogTheme(
    insetPadding: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(24)),
    ),
  ),

  // TEXTFIELD
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(
      vertical: 0,
      horizontal: 16,
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
    ),
    hintStyle: TextStyle(
      color: Colors.grey,
      fontFamily: 'w600',
    ),
  ),
);
