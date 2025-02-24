import 'package:flutter/material.dart';

import '../../../core/widgets/main_button.dart';
import '../../barchart/screens/barchart_screen.dart';
import '../../timer/screens/timer_screen.dart';
import '../../wheel/screens/wheel_screen.dart.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 60,
      ),
      children: [
        MainButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BarchartScreen()),
            );
          },
          title: 'Barchart',
        ),
        const SizedBox(height: 20),
        MainButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TimerScreen()),
            );
          },
          title: 'Timer',
        ),
        const SizedBox(height: 20),
        MainButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WheelScreen()),
            );
          },
          title: 'Wheel',
        ),
      ],
    );
  }
}
