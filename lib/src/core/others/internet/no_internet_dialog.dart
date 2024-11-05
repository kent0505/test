import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../config/app_colors.dart';
import '../../widgets/texts/text_widget.dart';
import 'bloc/internet_bloc.dart';

class NoInternetDialog extends StatelessWidget {
  const NoInternetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetBloc, InternetState>(
      listener: (context, state) {
        if (state is InternetSuccess) context.pop();
      },
      child: const Dialog(
        backgroundColor: AppColors.main,
        child: SizedBox(
          height: 150,
          child: Center(
            child: TextWidget(
              'No Internet',
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
