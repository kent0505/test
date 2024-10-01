import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          // Container(
          //   height: MediaQuery.of(context).viewPadding.top,
          //   color: AppColors.white,
          // ),
          Expanded(
            child: Stack(
              children: [
                // bg
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.black50,
                    // gradient: LinearGradient(
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                    //   colors: [
                    //     Color(0xff072434),
                    //     Color(0xff0D0819),
                    //   ],
                    // ),
                  ),
                ),

                // content
                body,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
