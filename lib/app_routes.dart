import 'package:cardapio_restaurante/utils/routes.dart';
import 'package:cardapio_restaurante/view/item_details/item_details.dart';
import 'package:cardapio_restaurante/view/register/register.dart';
import 'package:flutter/material.dart';
import 'package:cardapio_restaurante/view/login/login.dart';

import 'view/menu/menu.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    Routes.login: (context) => const Login(),
    Routes.menu: (context) => const Menu(),
    Routes.register: (context) => const Register(),
    Routes.itemDetails: (context) => const ItemDetails(),
  };
}
