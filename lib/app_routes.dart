import 'package:cardapio_restaurante/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:cardapio_restaurante/view/login/login.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    Routes.login: (context) => const Login()
  };
}
