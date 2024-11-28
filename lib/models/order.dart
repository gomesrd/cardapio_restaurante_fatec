import 'package:cloud_firestore/cloud_firestore.dart';

class OrderMenu {
  String? id;
  final String clientUid;
  late Timestamp createdAt;
  late String status;
  List<OrderItems> items;

  OrderMenu({
    this.id,
    required this.clientUid,
    required this.createdAt,
    required this.status,
    required this.items,
  });

  Map<String, dynamic> toJson() {
    return {
      'client_uid': clientUid,
      'created_at': createdAt,
      'status': status,
      'items': items.map((e) => {
        'item_name': e.itemName,
        'item_id': e.itemId,
        'price': e.price,
        'quantity': e.quantity,
      }).toList(),
    };
  }

  factory OrderMenu.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return OrderMenu(
      id: doc.id,
      clientUid: data['client_uid'],
      createdAt: data['created_at'],
      status: data['status'],
      items: (data['items'] as List).map((e) => OrderItems(
        itemId: e['item_id'],
        price: e['price'],
        quantity: e['quantity'],
        itemName: e['item_name'],
      )).toList(),
    );
  }

}

class OrderItems {
  final String itemId;
  final double price;
  late int quantity;
  final String itemName;

  get totalPrice => price * quantity;

  OrderItems({required this.itemId, required this.price, required this.quantity, required this.itemName});
}