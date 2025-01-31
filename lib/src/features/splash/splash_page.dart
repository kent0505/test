import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/test/test_bloc.dart';
import '../../core/db/prefs.dart';
import '../../core/widgets/loading_widget.dart';
import '../../core/widgets/custom_scaffold.dart';
import '../home/pages/home_page.dart';
import 'onboard_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: BlocListener<TestBloc, TestState>(
        listener: (context, state) {
          if (state is TestLoaded) {
            Future.delayed(
              const Duration(seconds: 2),
              () {
                if (context.mounted) {
                  if (context.mounted) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return onboard ? OnboardPage() : HomePage();
                        },
                      ),
                      (route) => false,
                    );
                  }

                  // context.go(onboard ? '/onboard' : '/home');
                }
              },
            );
          }
        },
        child: Center(
          child: LoadingWidget(),
        ),
      ),
    );
  }
}
