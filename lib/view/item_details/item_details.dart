import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

import '../../models/item_menu.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({super.key});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    ItemMenu itemData = ModalRoute.of(context)!.settings.arguments as ItemMenu;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Detalhes do item'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: ImageNetwork(
                    image: itemData.image,
                    height: 300.0,
                    width: 300.0,
                  ),
                ),
                ListTile(
                  title: const Text('Nome:', style: TextStyle(fontSize: 16)),
                  subtitle: Text(itemData.name, style: const TextStyle(fontSize: 22)),
                ),
                ListTile(
                  title: const Text('Preço:', style: TextStyle(fontSize: 16)),
                  subtitle: Text('R\$ ${itemData.price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 22)),
                ),
                ListTile(
                  title: const Text('Descrição:', style: TextStyle(fontSize: 16)),
                  subtitle: Text(itemData.description, style: const TextStyle(fontSize: 22)),
                ),
              ],
            )));
  }
}
