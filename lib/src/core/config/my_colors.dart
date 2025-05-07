import 'package:flutter/material.dart';

final class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.main,
    required this.accent,
  });

  final Color main;
  final Color accent;

  factory MyColors.dark() {
    return MyColors(
      main: Color(0xff69F0AE),
      accent: Color(0xffFF5252),
    );
  }

  factory MyColors.light() {
    return MyColors(
      main: Color(0xff69F0AE),
      accent: Color(0xffFF5252),
    );
  }

  @override
  MyColors copyWith({
    Color? main,
    Color? accent,
  }) {
    return MyColors(
      main: main ?? this.main,
      accent: accent ?? this.accent,
    );
  }

  @override
  MyColors lerp(ThemeExtension<MyColors>? other, double t) {
    if (other is! MyColors) return this;
    return MyColors(
      main: Color.lerp(main, other.main, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
    );
  }
}
