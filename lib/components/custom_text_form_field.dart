import 'package:flutter/material.dart';

import '../helpers/value_validation.dart';


class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final double fontSize;
  final double borderRadius;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.fontSize = 28,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(fontSize: fontSize),
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius)),
      ),
      validator: (value) {
        return ValueValidation.required(value) ?? ValueValidation.numeric(value);
      },
    );
  }
}
