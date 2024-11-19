import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  const NoData({
    super.key,
    this.expanded = true,
  });

  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return expanded
        ? const Expanded(
            child: Center(
              child: Text(
                'No data',
              ),
            ),
          )
        : const Center(
            child: Text(
              'No data',
            ),
          );
  }
}
