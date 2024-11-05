import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/app_colors.dart';
import '../../others/button/bloc/button_bloc.dart';
import '../texts/text_widget.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.width,
    required this.onPressed,
  });

  final String title;
  final double? width;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonBloc, ButtonState>(
      builder: (context, state) {
        return Container(
          height: 50,
          width: width,
          decoration: BoxDecoration(
            color: AppColors.main,
            borderRadius: BorderRadius.circular(8),
          ),
          child: CupertinoButton(
            onPressed: state is ButtonInitial ? onPressed : null,
            padding: EdgeInsets.zero,
            child: Center(
              child: TextWidget(
                title,
                fontSize: 16,
                color: state is ButtonInitial
                    ? Colors.white
                    : Colors.white.withOpacity(0.5),
              ),
            ),
          ),
        );
      },
    );
  }
}
