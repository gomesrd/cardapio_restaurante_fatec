import 'package:flutter/material.dart';

import '../../utils/assets.dart';
import '../../widgets/elevated_button_custom.dart';
import '../../widgets/loading_overlay.dart';
import '../../widgets/sized_box_custom.dart';
import '../../widgets/text_form_field_custom.dart';
import '../../service/auth_service.dart';
import '../../utils/routes.dart';
import '../../utils/strings.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formLoginPageKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;

  void _handleLogin() {
    if (formLoginPageKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
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
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
        isLoading: isLoading,
        child: Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                    key: formLoginPageKey,
                    child: Column(children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                            AppAssets.logoPath,
                            height: MediaQuery.of(context).size.height * 0.3,
                            fit: BoxFit.contain,
                          )),
                      const CustomSizedBox(),
                      CustomTextFormField(
                        controller: email,
                        labelText: AppStrings.emailLabel,
                        icon: Icons.email,
                      ),
                      const CustomSizedBox(),
                      CustomTextFormField(
                          controller: password,
                          labelText: AppStrings.passwordLabel,
                          isPassword: true,
                          icon: Icons.lock),
                      const CustomSizedBox(),
                      CustomElevatedButton(
                          value: AppStrings.loginLabel,
                          onPressed: () {
                            _handleLogin();
                          }),
                      const CustomSizedBox(),
                      CustomElevatedButton(
                          value: AppStrings.createAccountLabel,
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.register);
                          })
                    ])))));
  }
}
