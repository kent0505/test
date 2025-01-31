import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import 'button.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  final isActive = ValueNotifier(false);

  void onSwitch() {
    isActive.value = !isActive.value;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ValueListenableBuilder(
        valueListenable: isActive,
        builder: (context, value, child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 30,
            width: 60,
            decoration: BoxDecoration(
              color: value ? AppColors.white : AppColors.main,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Button(
              onPressed: onSwitch,
              minSize: 30,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 200),
                    top: 4,
                    left: value ? 34 : 4,
                    child: Container(
                      height: 22,
                      width: 22,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: value ? AppColors.redAccent : AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
