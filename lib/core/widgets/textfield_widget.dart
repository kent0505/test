import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
