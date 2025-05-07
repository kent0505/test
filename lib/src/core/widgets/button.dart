import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/constants.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.onPressed,
    this.padding = EdgeInsets.zero,
    this.minSize = kMinInteractiveDimensionCupertino,
    required this.child,
  });

  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;
  final double minSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: const CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            fontFamily: AppFonts.w700,
            color: Colors.black,
          ),
        ),
      ),
      child: CupertinoButton(
        onPressed: onPressed,
        padding: padding,
        minSize: minSize,
        child: child,
      ),
    );
  }
}
