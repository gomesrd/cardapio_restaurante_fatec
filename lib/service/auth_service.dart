// auth_service.dart

import 'package:flutter/material.dart';

import '../utils/routes.dart';

class AuthService {
  final String _mockUsername = "john.doe@fatec.sp.org.br";
  final String _mockPassword = "change123";

  void login({
    required TextEditingController usernameController,
    required TextEditingController passwordController,
    required GlobalKey<FormState> formLoginPageKey,
    required BuildContext context,
    required Function(String) onError,
  }) {
    if (formLoginPageKey.currentState!.validate()) {
      if (usernameController.text == _mockUsername && passwordController.text == _mockPassword) {
        formLoginPageKey.currentState!.reset();

        Navigator.pushNamed(context, Routes.menu);
      } else {
        onError("Email ou senha incorretos");
      }
    }
  }
}
