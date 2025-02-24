import 'package:flutter/material.dart';

import 'button.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            SizedBox(width: 16),
            Button(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'w700',
                ),
              ),
            ),
            SizedBox(width: 44),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
