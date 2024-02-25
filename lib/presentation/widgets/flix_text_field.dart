import 'package:flutter/material.dart';

class FlixTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;

  const FlixTextField(
      {super.key,
      required this.labelText,
      required this.controller,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
