import 'package:cloud_firestore/cloud_firestore.dart';

class MenuItems {
  final String? id;
  final String name;
  final String description;
  final String image;
  final double price;
  final bool active;
  final String categoryId;

  MenuItems(
      {
        this.id,
      required this.name,
      required this.description,
      required this.image,
      required this.price,
      required this.active,
      required this.categoryId});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'image': image,
      'price': price,
      'active': active,
      'category_id': categoryId,
    };
  }

  factory MenuItems.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return MenuItems(
        id: doc.id,
        name: data['name'],
        description: data['description'],
        image: data['image'],
        price: data['price'].toDouble(),
        active: data['active'],
        categoryId: data['category_id']);
  }
}
