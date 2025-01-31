import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/timer/timer_bloc.dart';
import '../../../core/widgets/button.dart';

class NavbarPage4 extends StatelessWidget {
  const NavbarPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 100),
        BlocBuilder<TimerBloc, TimerState>(
          builder: (context, state) {
            if (state is TimerStarted) {
              return Text(
                state.second.toString(),
                style: TextStyle(
                  color: Colors.white,
                ),
              );
            }

            return Button(
              onPressed: () {
                context.read<TimerBloc>().add(StartTimer(seconds: 50));
              },
              child: Text('Start timer'),
            );
          },
        ),
      ],
    );
  }
}
