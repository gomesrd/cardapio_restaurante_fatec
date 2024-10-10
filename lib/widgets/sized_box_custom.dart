import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomSizedBox extends StatefulWidget {
  final double? height;

  const CustomSizedBox({
    super.key,
    this.height,
  });

  @override
  _CustomSizedBoxState createState() => _CustomSizedBoxState();
}

class _CustomSizedBoxState extends State<CustomSizedBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 20.0,
    );
  }
}
