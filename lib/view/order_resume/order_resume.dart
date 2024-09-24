import 'package:cardapio_restaurante/components/custom_text.dart';
import 'package:flutter/material.dart';

import '../../utils/strings.dart';

class OrderItem {
  String name;
  int quantity;
  double price;

  OrderItem({required this.name, required this.quantity, required this.price});

  double get totalPrice => quantity * price;
}

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<OrderItem> orderItems = [
    OrderItem(name: "Item 1", quantity: 1, price: 10.0),
    OrderItem(name: "Item 2", quantity: 2, price: 15.0),
    OrderItem(name: "Item 3", quantity: 1, price: 25.0),
  ];

  double get totalGeneral => orderItems.fold(0.0, (total, item) => total + item.totalPrice);

  void updateQuantity(int index, int quantity) {
    setState(() {
      orderItems[index].quantity = quantity;
    });
  }

  void removeItem(int index) {
    setState(() {
      orderItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(labelText: AppStrings.orderItems),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: orderItems.length,
              itemBuilder: (context, index) {
                final item = orderItems[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Preço unitário: R\$ ${item.price.toStringAsFixed(2)}"),
                      Text("Quantidade: ${item.quantity}"),
                      Text("Total: R\$ ${item.totalPrice.toStringAsFixed(2)}"),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          if (item.quantity > 1) {
                            updateQuantity(index, item.quantity - 1);
                          }
                        },
                      ),
                      Text('${item.quantity}'),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          updateQuantity(index, item.quantity + 1);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          removeItem(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "Total geral: R\$ ${totalGeneral.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Ação para confirmar o pedido
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Pedido confirmado!")),
                    );
                  },
                  child: const Text("Confirmar Pedido"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
