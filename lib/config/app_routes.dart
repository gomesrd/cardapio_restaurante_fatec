import 'package:flutter/cupertino.dart';

import '../utils/routes.dart';
import '../view/item_details/item_details.dart';
import '../view/login/login.dart';
import '../view/menu/menu.dart';
import '../view/order_resume/order_resume.dart';
import '../view/register/register.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    Routes.login: (context) => const LoginView(),
    Routes.menu: (context) => const MenuView(),
    Routes.register: (context) => const RegisterView(),
    Routes.itemDetails: (context) => const ItemDetailsView(),
    Routes.orderResume: (context) => const OrderResumeView(),
  };
}
