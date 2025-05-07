import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/main_button.dart';
import '../../todo/screens/todos_screen.dart';

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
            context.push(TodosScreen.routePath);
          },
          title: 'Barchart',
        ),
        MainButton(
          onPressed: () {
            context.push(TodosScreen.routePath);
          },
          title: 'Barchart',
        ),
        const SizedBox(height: 20),
        MainButton(
          onPressed: () {
            context.push(TodosScreen.routePath);
          },
          title: 'Timer',
        ),
        const SizedBox(height: 20),
        MainButton(
          onPressed: () {
            context.push(TodosScreen.routePath);
          },
          title: 'Wheel',
        ),
      ],
    );
  }
}
