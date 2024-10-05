import 'package:flutter/material.dart';

import '../../components/elevated_button_custom.dart';
import '../../components/loading_overlay.dart';
import '../../components/text_form_field_custom.dart';
import '../../service/auth_service.dart';
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
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
        isLoading: isLoading,
        child: Scaffold(
            appBar: AppBar(),
            body: Form(
                key: formLoginPageKey,
                child: Expanded(
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
                            const CircularProgressIndicator();
                            if (formLoginPageKey.currentState!.validate()) {
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
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomElevatedButton(
                            value: AppStrings.goBackLabel,
                            onPressed: () {
                              Navigator.pop(context);
                            })
                      ])),
                ))));
  }
}
