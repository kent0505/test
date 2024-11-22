import 'package:flutter/material.dart';

import '../../config/my_fonts.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No data',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: MyFonts.w700,
        ),
      ),
    );
  }
}
