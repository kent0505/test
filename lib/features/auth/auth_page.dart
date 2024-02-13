import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/widgets/button_widget.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            ButtonWidget(
              title: 'Get started',
              onPressed: () {
                context.go('/home');
              },
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                context.push('/terms');
              },
              child: const Text('Terms and Conditions, Privacy Policy'),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
