import 'package:flutter/material.dart';

import '../../helpers/show_snack_bar.dart';
import '../../utils/assets.dart';
import '../../widgets/elevated_button_custom.dart';
import '../../widgets/loading_overlay.dart';
import '../../widgets/sized_box_custom.dart';
import '../../widgets/text_form_field_custom.dart';
import '../../service/auth/auth_service.dart';
import '../../utils/routes.dart';
import '../../utils/strings.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formLoginPageKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController(text: 'douglaspg@outlook.com');
  TextEditingController emailRecovery = TextEditingController(text: "");
  TextEditingController password = TextEditingController(text: '15059471');
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

  void _handleRecoveryPassword() {
    AuthService().recoveryPassword(emailRecovery.text);
    Navigator.pop(context);
    SnackBarHelper.showMessageSuccess(context, 'Email enviado com sucesso.');
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
                        value: AppStrings.recoveryPassword,
                        onPressed: () {
                          _showDialogRecoveryPassword();
                        },
                      ),
                      const CustomSizedBox(),
                      CustomElevatedButton(
                          value: AppStrings.createAccountLabel,
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.register);
                          })
                    ])))));
  }

  void _showDialogRecoveryPassword() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            title: Text("Esqueceu a senha?"),
            content: Container(
              height: 150,
              width: 300,
              child: Column(
                children: [
                  const Text(
                    "Informe seu email para receber um link de recuperação de senha.",
                  ),
                  SizedBox(height: 25),
                  CustomTextFormField(
                    controller: emailRecovery,
                    labelText: AppStrings.emailLabel,
                    icon: Icons.email,
                  ),
                ],
              ),
            ),
            actionsPadding: const EdgeInsets.all(20),
            actions: [
              ElevatedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(100, 40),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(100, 40),
                ),
                onPressed: () {
                  _handleRecoveryPassword();
                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        );
      },
    );
  }
}
