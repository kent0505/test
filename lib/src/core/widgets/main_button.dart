import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import 'button.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.title,
    this.width,
    this.isActive = true,
    required this.onPressed,
  });

  final String title;
  final double? width;
  final bool isActive;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 50,
      width: width,
      decoration: BoxDecoration(
        color: isActive ? AppColors.main : AppColors.redAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Button(
        onPressed: isActive ? onPressed : null,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.white,
            ),
            // fontSize: 16,
            // color: state is ButtonInitial
            //     ? Colors.white
            //     : Colors.white.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
