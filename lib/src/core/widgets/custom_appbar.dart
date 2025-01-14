import 'package:flutter/material.dart';

import 'my_button.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          MyButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.chevron_left),
          ),
        ],
      ),
    );
  }
}
