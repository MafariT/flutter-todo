import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({super.key, required this.text, required this.onPressed});

  final String text;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}