import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/timer/timer_bloc.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/widgets/main_button.dart';
import '../../../core/widgets/timer_widget.dart';

class NavbarPage4 extends StatelessWidget {
  const NavbarPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 100,
      ),
      children: [
        TimerWidget(),
        SizedBox(height: 20),
        MainButton(
          title: 'Start',
          onPressed: () {
            context.read<TimerBloc>().add(StartTimer(seconds: 20));
          },
        ),
        SizedBox(height: 20),
        MainButton(
          title: 'Stop',
          color: AppColors.accent,
          onPressed: () {
            context.read<TimerBloc>().add(StopTimer());
          },
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
