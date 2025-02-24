import 'package:flutter/material.dart';

import '../../../core/widgets/appbar.dart';
import '../widgets/bar_chart_widget.dart';

class BarchartScreen extends StatelessWidget {
  const BarchartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Appbar(title: 'Barchart'),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 40,
              ),
              children: [
                const SizedBox(height: 50),
                BarChartWidget(
                  titles: const ['W1', 'W2', 'W3', 'W4', 'W5', 'W6', 'W7'],
                  values1: const [200, 200, 1000, 600, 260, 800, 400],
                  values2: const [120, 500, 400, 700, 500, 200, 560],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
