import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.black,
      body: body,
      // body: Stack(
      //   children: [
      //     Container(
      //       decoration: BoxDecoration(
      //         color: Colors.black.withOpacity(0.4),
      //         // gradient: LinearGradient(
      //         //   begin: Alignment.topCenter,
      //         //   end: Alignment.bottomCenter,
      //         //   colors: [
      //         //     Color(0xff072434),
      //         //     Color(0xff0D0819),
      //         //   ],
      //         // ),
      //       ),
      //     ),
      //     body,
      //   ],
      // ),
    );
  }
}
