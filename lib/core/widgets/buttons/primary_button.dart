import 'package:flutter/material.dart';

import '../../config/app_colors.dart';
import '../texts/text_r.dart';
import 'cuper_button.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.active = true,
    this.width,
    required this.onPressed,
  });

  final String title;
  final bool active;
  final double? width;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(8),
      ),
      child: CuperButton(
        onPressed: active ? onPressed : null,
        padding: 0,
        child: Center(
          child: TextM(
            title,
            fontSize: 16,
            color: active ? AppColors.white : AppColors.white50,
          ),
        ),
      ),
    );
  }
}
