import 'package:cloud_firestore/cloud_firestore.dart';


class MenuService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> findAllCategories() {
    return firestore
        .collection('categories')
        .snapshots();
  }

  Stream<QuerySnapshot> findAllItems() {
    return firestore
        .collection('menu_items')
        .snapshots();
  }
}
