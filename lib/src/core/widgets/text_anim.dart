import 'package:flutter/material.dart';

class TextAnim extends StatelessWidget {
  const TextAnim({
    super.key,
    required this.title,
    this.color = Colors.greenAccent,
    this.fontSize = 20,
    this.fontFamily = 'w700',
    this.textStyle,
  });

  final String title;
  final Color color;
  final double fontSize;
  final String fontFamily;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: Text(
        key: ValueKey(title),
        title,
        style: textStyle ??
            TextStyle(
              color: color,
              fontSize: fontSize,
              fontFamily: fontFamily,
            ),
      ),
    );
  }
}
