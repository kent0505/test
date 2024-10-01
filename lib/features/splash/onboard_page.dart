import 'package:flutter/material.dart';

import '../../core/widgets/custom_scaffold.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: Column(
        children: [],
      ),
    );
  }
}
