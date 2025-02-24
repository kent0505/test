import 'package:flutter/material.dart';

class WheelWidget extends StatelessWidget {
  const WheelWidget({super.key});

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
