import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryMenu {
  final String id;
  final String description;
  final String name;
  final String image;
  final int order;

  CategoryMenu(
      {required this.id, required this.description, required this.name, required this.image, required this.order});

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'name': name,
      'image': image,
      'order': order,
    };
  }

  factory CategoryMenu.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CategoryMenu(
        id: data['id'],
        name: data['name'],
        description: data['description'],
        image: data['image'],
        order: data['order']);
  }
}
