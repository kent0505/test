import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/app_colors.dart';
import '../../core/db/prefs.dart';
import '../../core/widgets/custom_scaffold.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool loading = false;

  void load() async {
    await getData().then((onboard) {
      Future.delayed(Duration.zero, () {
        setState(() {
          loading = true;
        });
      });

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
    load();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 11,
              width: 270,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                color: AppColors.white50,
              ),
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 2),
                    height: 11,
                    width: loading ? 270 : 0,
                    decoration: BoxDecoration(
                      color: AppColors.main,
                      borderRadius: BorderRadius.circular(19),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
