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

  List list = [
    {
      "name": "Pizza Marguerita",
      "description": "Molho de tomate, mozzarella fresca e manjericão",
      "image": "assets/images/menu/pizza-margherita.jpg",
      "price": 30.00,
      "active": true,
      "category_id": "2"
    },
    {
      "name": "Pizza Pepperoni",
      "description": "Molho de tomate, mozzarella e pepperoni picante",
      "image": "assets/images/menu/pizza-pepperoni.jpg",
      "price": 35.00,
      "active": true,
      "category_id": "2"
    },
    {
      "name": "Pizza Quatro Queijos",
      "description": "Mistura de quatro queijos deliciosos",
      "image": "assets/images/menu/pizza-quatro-queijos.jpg",
      "price": 33.00,
      "active": true,
      "category_id": "2"
    },
    {
      "name": "Pizza Portuguesa",
      "description": "Presunto, ovos, cebola e azeitonas",
      "image": "assets/images/menu/pizza-portuguesa.jpg",
      "price": 32.00,
      "active": true,
      "category_id": "2"
    },
    {
      "name": "Pizza Frango com Catupiry",
      "description": "Frango desfiado com catupiry e molho de tomate",
      "image": "assets/images/menu/pizza-frango.jpg",
      "price": 36.00,
      "active": true,
      "category_id": "2"
    },
    {
      "name": "Espaguete à Bolonhesa",
      "description": "Massa spaghetti com molho bolonhesa",
      "image": "assets/images/menu/espaguete-bolonhesa.jpg",
      "price": 28.00,
      "active": true,
      "category_id": "3"
    },
    {
      "name": "Fettuccine Alfredo",
      "description": "Massa fettuccine com molho branco e queijo parmesão",
      "image": "assets/images/menu/fettucine-alfredo.jpg",
      "price": 30.00,
      "active": true,
      "category_id": "3"
    },
    {
      "name": "Lasanha",
      "description": "Lasanha de carne com molho de tomate e queijo gratinado",
      "image": "assets/images/menu/lasanha.jpg",
      "price": 32.00,
      "active": true,
      "category_id": "3"
    },
    {
      "name": "Ravioli de Ricota",
      "description": "Ravioli recheado com ricota e espinafre",
      "image": "assets/images/menu/ravioli-ricota.jpg",
      "price": 27.00,
      "active": true,
      "category_id": "3"
    },
    {
      "name": "Espaguete à Carbonara",
      "description": "Massa espaguete com bacon e molho carbonara",
      "image": "assets/images/menu/espaguete-carbonara.jpg",
      "price": 29.00,
      "active": true,
      "category_id": "3"
    },
    {
      "name": "Salada Caesar",
      "description": "Alface romana, croutons, queijo parmesão e molho caesar",
      "image": "assets/images/menu/salada-caesar.jpg",
      "price": 20.00,
      "active": true,
      "category_id": "4"
    },
    {
      "name": "Salada Grega",
      "description": "Tomate, pepino, azeitonas, cebola roxa e queijo feta",
      "image": "assets/images/menu/salada-grega.jpg",
      "price": 22.00,
      "active": true,
      "category_id": "4"
    },
    {
      "name": "Salada Caprese",
      "description": "Tomate, mozzarella e manjericão fresco",
      "image": "assets/images/menu/salada-caprese.jpg",
      "price": 18.00,
      "active": true,
      "category_id": "4"
    },
    {
      "name": "Salada de Frango",
      "description": "Frango grelhado, alface, tomate e molho de mostarda",
      "image": "assets/images/menu/salada-frango.jpg",
      "price": 25.00,
      "active": true,
      "category_id": "4"
    },
    {
      "name": "Salada Tropical",
      "description": "Frutas tropicais com folhas verdes e molho especial",
      "image": "assets/images/menu/salada-tropical.jpg",
      "price": 19.00,
      "active": true,
      "category_id": "4"
    },
    {
      "name": "Petit Gâteau",
      "description": "Bolo de chocolate com sorvete de creme",
      "image": "assets/images/menu/petit-gateau.jpg",
      "price": 18.00,
      "active": true,
      "category_id": "5"
    },
    {
      "name": "Pudim",
      "description": "Pudim de leite condensado com calda de caramelo",
      "image": "assets/images/menu/pudim.jpg",
      "price": 10.00,
      "active": true,
      "category_id": "5"
    },
    {
      "name": "Brownie",
      "description": "Brownie de chocolate com nozes",
      "image": "assets/images/menu/brownie.jpg",
      "price": 12.00,
      "active": true,
      "category_id": "5"
    },
    {
      "name": "Torta de Limão",
      "description": "Torta de limão com massa crocante",
      "image": "assets/images/menu/torta-limao.jpg",
      "price": 14.00,
      "active": true,
      "category_id": "5"
    },
    {
      "name": "Sorvete",
      "description": "Taça de sorvete de creme com cobertura de chocolate",
      "image": "assets/images/menu/sorvete.jpg",
      "price": 8.00,
      "active": true,
      "category_id": "5"
    },
    {
      "name": "Coca-Cola",
      "description": "Refrigerante Coca-Cola 350ml",
      "image": "assets/images/menu/coca-cola.jpg",
      "price": 5.00,
      "active": true,
      "category_id": "6"
    },
    {
      "name": "Suco de Laranja",
      "description": "Suco de laranja natural 300ml",
      "image": "assets/images/menu/suco-laranja.jpg",
      "price": 8.00,
      "active": true,
      "category_id": "6"
    },
    {
      "name": "Água Mineral",
      "description": "Água mineral sem gás 600ml",
      "image": "assets/images/menu/agua-mineral.jpg",
      "price": 3.00,
      "active": true,
      "category_id": "6"
    }
  ];

  Future<void> createCategoria() async {
    var orderId = list.forEach((element) async {
      await firestore.collection('menu_items').add(element);
    });
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
