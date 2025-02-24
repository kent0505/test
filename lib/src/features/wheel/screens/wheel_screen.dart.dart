import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/wheel_bloc.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/dialog_widget.dart';
import '../../../core/widgets/main_button.dart';
import '../widgets/wheel_widget.dart';

class WheelScreen extends StatelessWidget {
  const WheelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Appbar(title: 'Wheel'),
          SizedBox(height: 50),
          BlocConsumer<WheelBloc, WheelState>(
            listener: (context, state) {
              if (state is WheelStopped && state.canSpin) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return DialogWidget(
                      title: 'Win',
                      body: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: state.color,
                        ),
                      ),
                      onlyClose: true,
                      onYes: () {},
                    );
                  },
                );
              }
            },
            builder: (context, state) {
              return AnimatedRotation(
                turns: state is WheelStopped ? state.turns : 0,
                curve: Curves.easeInOutCirc,
                duration: const Duration(seconds: 10),
                child: WheelWidget(),
              );
            },
          ),
          SizedBox(height: 50),
          BlocBuilder<WheelBloc, WheelState>(
            builder: (context, state) {
              return MainButton(
                title: 'Spin',
                isActive: state is WheelInitial ||
                    state is WheelStopped && state.canSpin,
                onPressed: () {
                  context.read<WheelBloc>().add(StartSpin());
                },
              );
            },
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
