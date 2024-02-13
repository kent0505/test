import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/widgets/loading_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future load() async {
    Future.delayed(const Duration(seconds: 1), () {
      context.go('/auth');
    });
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoadingWidget(),
    );
  }
}
