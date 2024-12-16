import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: Offset(-20, -20),
                blurRadius: 60,
                color: Colors.white,
              ),
              BoxShadow(
                offset: Offset(20, 20),
                blurRadius: 60,
                color: Color(0xFFBEBEBE),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
