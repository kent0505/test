import 'package:flutter/material.dart';

import '../config/constants.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return Center(
      child: Text(
        l.noData,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'w700',
        ),
      ),
    );
  }
}
