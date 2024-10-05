import 'package:flutter/material.dart';

import '../../components/elevated_button_custom.dart';
import '../../components/loading_overlay.dart';
import '../../components/text_form_field_custom.dart';
import '../../service/auth_service.dart';
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
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
        isLoading: isLoading,
        child: Scaffold(
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
                      // LoadingOverlay(isLoading: isLoading),
                      // const SizedBox(height: 20),
                      CustomElevatedButton(
                          value: AppStrings.loginLabel,
                          onPressed: () {
                            if (formLoginPageKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              formLoginPageKey.currentState!.save();
                              AuthService().login(
                                email: email.text,
                                password: password.text,
                                formLoginPageKey: formLoginPageKey,
                                context: context,
                                onLoading: (loading) {
                                  setState(() {
                                    isLoading = loading;
                                  });
                                },
                              );
                            }
                          }),
                      const SizedBox(height: 20),
                      CustomElevatedButton(
                          value: AppStrings.createAccountLabel,
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.register);
                          })
                    ])))));
  }
}
