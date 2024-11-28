import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../models/category_menu.dart';
import '../models/order.dart';
import '../service/auth/auth_service.dart';

class OrderStore extends ChangeNotifier {
  final List<CategoryMenu> _listCategories = [];
  late final OrderMenu _orderMenu =
      OrderMenu(clientUid: AuthService().getUidCurrentUser(), createdAt: Timestamp.now(), status: 'PENDING', items: []);

  String? _orderId = null;

  String? get orderId => _orderId;

  List<CategoryMenu> get listMenu => _listCategories;

  OrderMenu get orderMenu => _orderMenu;

  double get total => _orderMenu.items.fold(0.0, (sum, item) => sum + item.totalPrice);

  void addItem(OrderItems item) {
    _orderMenu.items.add(item);
    notifyListeners();
  }

  void removeItem(OrderItems item) {
    _orderMenu.items.remove(item);
    notifyListeners();
  }

  void updateItemQuantity(OrderItems item, int quantity) {
    int index = _orderMenu.items.indexWhere((existingItem) => existingItem.itemId == item.itemId);

    if (index >= 0) {
      _orderMenu.items[index].quantity = quantity;
    }
    notifyListeners();
  }

  void clearOrder() {
    _orderMenu.items.clear();
    _orderMenu.status = 'PENDING';
    _orderMenu.createdAt = Timestamp.now();
    _orderId = null;
    notifyListeners();
  }

  void setOrderId(String orderId) {
    _orderId = orderId;
  }
}
