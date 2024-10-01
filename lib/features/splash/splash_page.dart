import 'package:flutter/material.dart';

import '../../core/config/router.dart';
import '../../core/db/prefs.dart';
import '../../core/widgets/custom_scaffold.dart';
import '../../core/widgets/texts/text_r.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  void load() async {
    await getData().then((onboard) {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          if (onboard) {
            // context.go('/onboard');
            context.go('/home');
          } else {
            context.go('/home');
          }
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
    load();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: RotationTransition(
          turns: controller,
          child: const TextM('Loading...', fontSize: 20),
        ),
      ),
    );
  }
}
