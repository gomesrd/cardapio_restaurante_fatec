import 'package:flutter/material.dart';
import '../helpers/value_validation.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final TextEditingController? passwordConfirm;
  final double fontSize;
  final double borderRadius;
  final bool isPassword;
  final IconData? icon;

  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.labelText,
      this.passwordConfirm,
      this.fontSize = 28,
      this.borderRadius = 12,
      this.isPassword = false,
      this.icon});

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  get passwordConfirm => widget.passwordConfirm;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      style: TextStyle(fontSize: widget.fontSize),
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(widget.borderRadius)),
        prefixIcon: (widget.icon == null) ? null : Icon(widget.icon),
        suffixIcon: () {
          if (widget.isPassword) {
            return IconButton(
              icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            );
          }
        }(),
      ),
      validator: (value) {
        String? isRequired = ValueValidation.required(value);

        if (isRequired != null) {
          return isRequired;
        }

        if (widget.isPassword && passwordConfirm != null) {
          String? isPasswordValid =
              ValueValidation.validateConfirmPassword(value, passwordConfirm.text);
          print(value);
          print("confirmação: $passwordConfirm");
          if (isPasswordValid != null) {
            return isPasswordValid;
          }
        }

        return null;
      },
    );
  }
}
