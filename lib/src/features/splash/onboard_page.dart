import 'package:flutter/material.dart';

import '../../core/db/prefs.dart';
import '../../core/widgets/main_button.dart';
import '../../core/widgets/custom_scaffold.dart';
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

  void onNext() async {
    if (index == 2) {
      await saveBool('onboard', false);
      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false,
        );
      }
    } else {
      setState(() {
        index++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
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
