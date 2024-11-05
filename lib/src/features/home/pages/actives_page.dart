import 'package:flutter/material.dart';

import '../../../core/widgets/texts/text_widget.dart';

class ActivesPage extends StatelessWidget {
  const ActivesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TextWidget(
          'Actives',
          fontSize: 20,
        ),
      ],
    );
  }
}
