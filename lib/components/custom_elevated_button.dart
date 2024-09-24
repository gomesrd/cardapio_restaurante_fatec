import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String value;
  final VoidCallback? onPressed;
  final Color? color;
  final double? width;
  final double? height;
  final TextStyle? textStyle;

  const CustomElevatedButton({
    super.key,
    required this.value,
    this.onPressed,
    this.color,
    this.width,
    this.height,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            // backgroundColor: color ?? Theme.of(context).primaryColor,
            // textStyle: textStyle ?? const TextStyle(fontSize: 16, color: Colors.black),
            ),
        onPressed: onPressed,
        child: Text(value),
      ),
    );
  }
}
