import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No data',
        style: TextStyle(
          color: AppColors.white,
          fontSize: 16,
          fontFamily: 'w700',
        ),
      ),
    );
  }
}
