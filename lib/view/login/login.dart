import 'package:flutter/material.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';
import '../../utils/routes.dart';
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
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                key: formLoginPageKey,
                child: Column(children: [
                  CustomTextFormField(
                    controller: email,
                    labelText: AppStrings.emailLabel,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: password,
                    labelText: AppStrings.passwordLabel,
                    isPassword: true,
                  ),
                  const SizedBox(height: 20),
                  CustomElevatedButton(
                      value: AppStrings.loginLabel,
                      onPressed: () {
                        if (formLoginPageKey.currentState!.validate()) {
                          formLoginPageKey.currentState!.reset();
                          Navigator.pushNamed(context, Routes.menu);
                        }
                      }),
                  const SizedBox(height: 20),
                  CustomElevatedButton(
                      value: AppStrings.createAccountLabel,
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.register);
                      })
                ]))));
  }
}
