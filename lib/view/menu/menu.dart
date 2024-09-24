import 'package:cached_network_image/cached_network_image.dart';
import 'package:cardapio_restaurante/helpers/generate_menu.dart';
import 'package:image_network/image_network.dart';
import 'package:flutter/material.dart';

import '../../models/category_menu.dart';
import '../../utils/routes.dart';
import '../../utils/strings.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<CategoryMenu> listMenu = [];

  @override
  void initState() {
    listMenu = GenerateMenu.generateMenu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.menuLabel),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              icon: Stack(children: <Widget>[
                const Icon(Icons.shopping_cart, size: 32),
                Positioned(
                    right: 0,
                    child: Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: const Text(
                          '3',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        )))
              ]),
              onPressed: () {
                Navigator.pushNamed(context, Routes.orderResume);
              }),
          IconButton(
              icon: const Icon(Icons.logout, size: 32),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
              itemCount: listMenu.length,
              itemBuilder: (context, index) {
                final category = listMenu[index];
                return Card(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      category.name,
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                      children: category.items.map((item) {
                    return ListTile(
                        title: Text(item.name),
                        subtitle: Text(item.description),
                        trailing: Text('R\$ ${item.price.toStringAsFixed(2)}'),
                        leading: SizedBox(
                          height: 50,
                          width: 50,
                          child: CachedNetworkImage(
                            imageUrl: item.image,
                            progressIndicatorBuilder: (context, url, downloadProgress) =>
                                CircularProgressIndicator(value: downloadProgress.progress),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.itemDetails,
                            arguments: item,
                          );
                        });
                  }).toList())
                ]));
              })),
    );
  }
}
