import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.greenAccent,
      height: 50,
      minWidth: 150,
      child: Text(title),
    );
  }
}
