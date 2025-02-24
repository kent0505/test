import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/main_button.dart';
import '../../home/screens/home_screen.dart';
import '../data/onboard_repository.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
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
      await context.read<OnboardRepository>().removeOnboard();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
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
