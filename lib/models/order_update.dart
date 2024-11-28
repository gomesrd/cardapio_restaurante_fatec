import 'order.dart';

class OrderMenuUpdate {
  final String status;
  final List<OrderItems> items;

  OrderMenuUpdate({
    required this.status,
    required this.items,
  });

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'items': items.map((e) => {
        'item_id': e.itemId,
        'price': e.price,
        'quantity': e.quantity,
      }).toList(),
    };
  }
}