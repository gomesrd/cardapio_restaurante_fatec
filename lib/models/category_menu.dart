import 'dart:ffi';

import 'item_menu.dart';

class CategoryMenu {
  final String name;
  final List<ItemMenu> items;

  CategoryMenu(this.name, this.items);
}
