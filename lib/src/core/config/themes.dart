import 'package:flutter/material.dart';

import 'constants.dart';
import 'my_colors.dart';

final _ligth = MyColors.light();
// final _dark = MyColors.dark();

final lightTheme = ThemeData(
  useMaterial3: false,
  fontFamily: AppFonts.w400,
  brightness: Brightness.dark,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: _ligth.main,
    selectionColor: _ligth.main,
    selectionHandleColor: _ligth.main,
  ),

  // OVERSCROLL
  // colorScheme: ColorScheme.light(
  //   surface: _ligth.bg,
  //   secondary: _ligth.tertiaryFour, // overscroll
  // ),

  // SCAFFOLD
  //  scaffoldBackgroundColor: _ligth.bg,

  // APPBAR
  // appBarTheme: AppBarTheme(
  //   toolbarHeight: 48,
  //   backgroundColor: _ligth.bg,
  //   titleTextStyle: TextStyle(
  //     color: _ligth.textPrimary,
  //     fontSize: 18,
  //     fontFamily: AppFonts.bold,
  //   ),
  //   centerTitle: true,
  //   elevation: 0,
  //   actionsPadding: EdgeInsets.symmetric(horizontal: 16),
  // ),

  // DIALOG
  dialogTheme: const DialogTheme(
    insetPadding: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(14)),
    ),
  ),

  // TEXTFIELD
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    // fillColor: _ligth.tertiaryOne,
    contentPadding: const EdgeInsets.symmetric(
      vertical: 16,
      horizontal: 16,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Colors.transparent),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Colors.transparent),
    ),
    hintStyle: const TextStyle(
      // color: _ligth.textSecondary,
      fontSize: 14,
      fontFamily: AppFonts.w600,
    ),
  ),

  // BOTTOM SHEET
  // bottomSheetTheme: BottomSheetThemeData(
  //   backgroundColor: _ligth.bg,
  // ),
  extensions: [_ligth],
);
