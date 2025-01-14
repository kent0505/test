import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(
        color: Colors.white,
        radius: 15,
      ),
    );
  }
}

class LoadingWidget2 extends StatelessWidget {
  const LoadingWidget2({
    super.key,
    required this.loading,
  });

  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 11,
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
          color: Colors.white.withValues(alpha: 0.5),
        ),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 2),
              height: 11,
              width: loading ? 270 : 0,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(19),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingWidget3 extends StatefulWidget {
  const LoadingWidget3({super.key});

  @override
  State<LoadingWidget3> createState() => _LoadingWidget3State();
}

class _LoadingWidget3State extends State<LoadingWidget3>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: controller,
        child: const Text('Loading...'),
      ),
    );
  }
}
