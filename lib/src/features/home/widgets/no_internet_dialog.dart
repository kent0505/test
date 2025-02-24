import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/internet/internet_bloc.dart';

class NoInternetDialog extends StatelessWidget {
  const NoInternetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetBloc, InternetState>(
      listener: (context, state) {
        if (state is InternetSuccess) Navigator.pop(context);
      },
      child: PopScope(
        canPop: false,
        child: const Dialog(
          backgroundColor: Colors.greenAccent,
          child: SizedBox(
            height: 150,
            width: 200,
            child: Center(
              child: Text(
                'No Internet',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
