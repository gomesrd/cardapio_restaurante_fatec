import 'package:flutter/material.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';
import '../../utils/strings.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> formLoginPageKey = GlobalKey<FormState>();
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Form(
            key: formLoginPageKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                CustomTextFormField(
                  controller: fullName,
                  labelText: AppStrings.fullNameLabel,
                ),
                const SizedBox(height: 20),
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
                CustomTextFormField(
                  controller: confirmPassword,
                  labelText: AppStrings.confirmPasswordLabel,
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                CustomElevatedButton(
                  value: AppStrings.registerLabel,
                  onPressed: () {
                    if (formLoginPageKey.currentState!.validate()) {
                      formLoginPageKey.currentState!.save();
                      Navigator.pop(context);
                    }
                  },
                ),
                const SizedBox(height: 20),
                CustomElevatedButton(
                  value: AppStrings.goBackLabel,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ]),
            )));
  }
}
