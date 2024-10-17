import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../helpers/show_snack_bar.dart';
import '../utils/messages.dart';
import '../view/menu/menu.dart';

class AuthService {
  void login(
      {required String email,
      required String password,
      required GlobalKey<FormState> formLoginPageKey,
      required BuildContext context,
      required Function(bool) onLoading}) {
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((res) {
      if (context.mounted) {
        formLoginPageKey.currentState!.reset();
        // Navigator.pushNamed(context, Routes.menu);
        onLoading(false);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MenuView()),
          (Route<dynamic> route) => false,
        );
      }
    }).catchError((e) {
      onLoading(false);
      if (context.mounted) {
        switch (e.code) {
          case 'invalid-email':
            SnackBarHelper.showMessageError(context, AppMessages.invalidEmailMessage);
            break;
          default:
            SnackBarHelper.showMessageError(context, AppMessages.invalidEmailOrPasswordMessage);
            break;
        }
      }
    });
  }

  void createAccount(
      {required String email,
      required String password,
      required String fullName,
      required GlobalKey<FormState> formLoginPageKey,
      required BuildContext context,
      required Function(bool) onLoading}) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((res) {
      FirebaseFirestore.instance.collection('users').add({
        "uid": res.user!.uid.toString(),
        "full_name": fullName,
      });
      onLoading(false);
      formLoginPageKey.currentState!.reset();
      if (context.mounted) {
        Navigator.pop(context);
        SnackBarHelper.showMessageSuccess(context, AppMessages.successRegisterUserMessage);
      }
    }).catchError((e) {
      onLoading(false);
      if (context.mounted) {
        switch (e.code) {
          case 'invalid-email':
            SnackBarHelper.showMessageError(context, AppMessages.invalidEmailMessage);
            break;
          default:
            SnackBarHelper.showMessageError(context, AppMessages.errorRegisterMessage);
            break;
        }
      }
    });
  }

  void logout() {
    FirebaseAuth.instance.signOut();
  }
}
