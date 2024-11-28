import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/menu_items.dart';
import '../../models/order.dart';
import '../../models/order_update.dart';

class OrderService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String> createOrder({required OrderMenu orderRequest}) async {
    var orderId = await firestore.collection('orders').add(orderRequest.toJson());
    return orderId.id;
  }

  Future<bool> updateOrder({required OrderMenuUpdate orderMenuUpdateRequest, required String docId}) async {
    try {
      await firestore.collection('orders').doc(docId).update(orderMenuUpdateRequest.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  Stream<QuerySnapshot> findAllOrders() {
    return firestore.collection('orders').snapshots();
  }
}
