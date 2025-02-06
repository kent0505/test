import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/wheel/wheel_bloc.dart';
import '../../../core/widgets/dialog_widget.dart';
import '../../../core/widgets/main_button.dart';

class NavbarPage5 extends StatelessWidget {
  const NavbarPage5({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              child: _Wheel(),
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
    );
  }
}

class _Wheel extends StatelessWidget {
  const _Wheel();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(300),
      child: SizedBox(
        height: 300,
        width: 300,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 150,
                width: 150,
                color: Colors.redAccent,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 150,
                width: 150,
                color: Colors.orangeAccent,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 150,
                width: 150,
                color: Colors.blueAccent,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 150,
                width: 150,
                color: Colors.deepPurpleAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
