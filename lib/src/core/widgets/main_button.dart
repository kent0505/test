import 'package:flutter/material.dart';

import '../config/constants.dart';
import 'button.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.title,
    this.width,
    this.horizontal = 0,
    this.color,
    this.isActive = true,
    required this.onPressed,
  });

  final String title;
  final double? width;
  final double horizontal;
  final Color? color;
  final bool isActive;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 50,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: horizontal),
      decoration: BoxDecoration(
        color: color ?? (isActive ? AppColors.main : AppColors.accent),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Button(
        onPressed: isActive ? onPressed : null,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.black,
              fontSize: 16,
              fontFamily: AppFonts.w700,
            ),
          ),
        ),
      ),
    );
  }
}
