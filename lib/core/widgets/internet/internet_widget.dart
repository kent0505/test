import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/internet_bloc.dart';
import '../../utils.dart';
import '../dialogs/no_internet.dart';

class InternetWidget extends StatelessWidget {
  const InternetWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetBloc, InternetState>(
      listener: (context, state) {
        logger(state);
        if (state is InternetFailure) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return const NoInternet();
            },
          );
        }

        if (state is InternetSuccess && state.dialog) {
          context.pop();
        }
      },
      child: child,
    );
  }
}
