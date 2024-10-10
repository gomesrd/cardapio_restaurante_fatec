import 'package:flutter/material.dart';
import '../helpers/value_validation.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String? passwordConfirm;
  final double fontSize;
  final double borderRadius;
  final bool isPassword;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.passwordConfirm,
    this.fontSize = 28,
    this.borderRadius = 12,
    this.isPassword = false
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      style: TextStyle(fontSize: widget.fontSize),
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(widget.borderRadius)),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
      validator: (value) {
        String? isRequired = ValueValidation.required(value);

        if (isRequired != null) {
          return isRequired;
        }

        if (widget.isPassword && widget.passwordConfirm != null) {
          String? isPasswordValid = ValueValidation.validateConfirmPassword(value, widget.passwordConfirm);

          if (isPasswordValid != null) {
            return isPasswordValid;
          }
        }

        return null;
      },
    );
  }
}
