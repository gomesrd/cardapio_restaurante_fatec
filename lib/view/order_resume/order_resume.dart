import 'package:cardapio_restaurante/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../store/order_store.dart';
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
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<OrderStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const CustomText(labelText: AppStrings.orderItems),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: store.items.length,
              itemBuilder: (context, index) {
                final item = store.items[index];
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
                            store.updateItemQuantity(item, item.quantity - 1);
                          }
                        },
                      ),
                      Text('${item.quantity}'),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          store.updateItemQuantity(item, item.quantity + 1);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          store.removeItem(item);
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
                  "Total geral: R\$ ${store.total.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (store.items.isEmpty) return;
                    store.clear();
                    Navigator.pop(context);
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
