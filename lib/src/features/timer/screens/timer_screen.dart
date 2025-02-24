import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/timer_bloc.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/config/constants.dart';
import '../../../core/widgets/main_button.dart';
import '../../../core/widgets/timer_widget.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Appbar(title: 'Timer'),
          Expanded(
            child: ListView(
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
            ),
          ),
        ],
      ),
    );
  }
}
