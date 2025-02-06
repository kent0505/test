import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import 'button.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({
    super.key,
    required this.isActive,
    required this.onPressed,
  });

  final bool isActive;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 30,
        width: 60,
        decoration: BoxDecoration(
          color: isActive ? Colors.white : AppColors.main,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Button(
          onPressed: onPressed,
          minSize: 30,
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                top: 4,
                left: isActive ? 34 : 4,
                child: Container(
                  height: 22,
                  width: 22,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive ? AppColors.accent : Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
