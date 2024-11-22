import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../blocs/test/test_bloc.dart';
import '../../core/db/prefs.dart';
import '../../core/widgets/others/loading_widget.dart';
import '../../core/widgets/custom_scaffold.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: BlocConsumer<TestBloc, TestState>(
        listener: (context, state) {
          if (state is TestLoaded) {
            Future.delayed(
              const Duration(seconds: 2),
              () {
                if (context.mounted) {
                  if (onboard) {
                    context.go('/onboard');
                  } else {
                    context.go('/home');
                  }
                }
              },
            );
          }
        },
        builder: (context, state) {
          return const Center(
            child: LoadingWidget(),
          );
        },
      ),
    );
  }
}
