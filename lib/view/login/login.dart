import 'package:flutter/material.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';
import '../../utils/strings.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formLoginPageKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Form(
            key: formLoginPageKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: email,
                    labelText: AppStrings.emailLabel,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: password,
                    labelText: AppStrings.passwordLabel,
                  ),
                  const SizedBox(height: 20),
                  CustomElevatedButton(
                    value: AppStrings.loginLabel,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 20),
                  CustomElevatedButton(
                    value: AppStrings.createAccountLabel,
                    onPressed: () {},
                  ),
                ],
              ),
            )));
  }
}
