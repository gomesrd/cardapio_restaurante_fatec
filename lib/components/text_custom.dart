import 'package:flutter/material.dart';
import '../helpers/value_validation.dart';

class CustomText extends StatefulWidget {
  final String labelText;

  const CustomText({
    super.key,
    required this.labelText,
  });

  @override
  _CustomTextState createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.labelText,
    );
  }
}
