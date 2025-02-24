import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/test/test_bloc.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../home/screens/home_screen.dart';
import '../data/onboard_repository.dart';
import 'onboard_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<TestBloc, TestState>(
        listener: (context, state) {
          if (state is TestLoaded) {
            Future.delayed(
              const Duration(seconds: 2),
              () {
                if (context.mounted) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return context.read<OnboardRepository>().isOnBoard()
                            ? OnboardScreen()
                            : HomeScreen();
                      },
                    ),
                    (route) => false,
                  );
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
