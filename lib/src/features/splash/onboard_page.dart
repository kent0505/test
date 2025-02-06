import 'package:flutter/material.dart';

import '../../core/db/prefs.dart';
import '../../core/widgets/main_button.dart';
import '../home/pages/home_page.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  int index = 1;

  String getTitle() {
    if (index == 1) return '';
    return '';
  }

  String getDescription() {
    if (index == 1) return '';
    return '';
  }

  void onNext() {
    if (index == 2) {
      saveBool('onboard', false);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
        (route) => false,
      );
    } else {
      setState(() {
        index++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            getTitle(),
          ),
          Text(
            getDescription(),
          ),
          MainButton(
            title: 'Go Home',
            onPressed: onNext,
          ),
        ],
      ),
    );
  }
}
