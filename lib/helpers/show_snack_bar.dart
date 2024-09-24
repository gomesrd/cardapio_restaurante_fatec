import 'package:flutter/material.dart';
import '../../utils/strings.dart';

void showSnackBar(BuildContext context, String message, {int durationSeconds = 2}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(seconds: durationSeconds),
    ),
  );
}
