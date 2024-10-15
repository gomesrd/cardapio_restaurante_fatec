import 'package:flutter/material.dart';

import '../../widgets/elevated_button_custom.dart';
import '../../widgets/loading_overlay.dart';
import '../../widgets/sized_box_custom.dart';
import '../../widgets/text_form_field_custom.dart';
import '../../service/auth_service.dart';
import '../../utils/strings.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> formLoginPageKey = GlobalKey<FormState>();
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool isLoading = false;

  void _handleLogin() {
    const CircularProgressIndicator();
    if (formLoginPageKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      setState(() {
        isLoading = true;
      });
      formLoginPageKey.currentState!.save();
      AuthService().createAccount(
          email: email.text,
          password: password.text,
          fullName: fullName.text,
          formLoginPageKey: formLoginPageKey,
          context: context,
          onLoading: (loading) {
            setState(() {
              isLoading = loading;
            });
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
        isLoading: isLoading,
        child: Scaffold(
            appBar: AppBar(
              title: const Text(AppStrings.registerTitle),
            ),
            body: SingleChildScrollView(
                child: Form(
                    key: formLoginPageKey,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          CustomTextFormField(
                              controller: fullName,
                              labelText: AppStrings.fullNameLabel,
                              icon: Icons.person),
                          const CustomSizedBox(),
                          CustomTextFormField(
                              controller: email,
                              labelText: AppStrings.emailLabel,
                              icon: Icons.email),
                          const CustomSizedBox(),
                          CustomTextFormField(
                              controller: password,
                              labelText: AppStrings.passwordLabel,
                              isPassword: true,
                              icon: Icons.lock),
                          const CustomSizedBox(),
                          CustomTextFormField(
                              controller: confirmPassword,
                              labelText: AppStrings.confirmPasswordLabel,
                              passwordConfirm: password,
                              isPassword: true,
                              icon: Icons.lock),
                          const CustomSizedBox(),
                          CustomElevatedButton(
                            value: AppStrings.registerLabel,
                            onPressed: () {
                              _handleLogin();
                            },
                          ),
                          const CustomSizedBox(),
                          CustomElevatedButton(
                              value: AppStrings.goBackLabel,
                              onPressed: () {
                                Navigator.pop(context);
                              })
                        ]))))));
  }
}
