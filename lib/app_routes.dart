import 'package:cardapio/utils/routes.dart';
import 'package:cardapio/view/item_details/item_details.dart';
import 'package:cardapio/view/order_resume/order_resume.dart';
import 'package:cardapio/view/register/register.dart';
import 'package:flutter/material.dart';
import 'package:cardapio/view/login/login.dart';

import 'view/menu/menu.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    Routes.login: (context) => const LoginView(),
    Routes.menu: (context) => const MenuView(),
    Routes.register: (context) => const RegisterView(),
    Routes.itemDetails: (context) => const ItemDetailsView(),
    Routes.orderResume: (context) => const OrderResumeView(),
  };
}
