import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../blocs/test/test_bloc.dart';
import '../../core/db/db.dart';
import '../../core/db/prefs.dart';
import '../../core/widgets/others/loading_widget.dart';
import '../../core/widgets/custom_scaffold.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool loading = false;

  void load() async {
    await initDB().then((value) {
      if (mounted) context.read<TestBloc>().add(GetTestEvent());

      setState(() {
        loading = true;
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
          LoadingWidget2(loading: loading),
        ],
      ),
    );
  }
}
