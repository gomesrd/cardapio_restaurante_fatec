import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text.dart';
import '../../helpers/show_snack_bar.dart';
import '../../models/item_menu.dart';
import '../../utils/strings.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({super.key});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  int _quantity = 1;

  void _confirmItem() {
    showSnackBar(context, AppStrings.itemAddOrder);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    ItemMenu itemData = ModalRoute.of(context)!.settings.arguments as ItemMenu;

    return Scaffold(
        appBar: AppBar(
          title: const CustomText(labelText: AppStrings.detailsItem),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CachedNetworkImage(
                imageUrl: itemData.image,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            ListTile(
              title: Text(itemData.name, style: const TextStyle(fontSize: 22)),
            ),
            ListTile(
              title: const Text('${AppStrings.descriptionLabel}:', style: TextStyle(fontSize: 16)),
              subtitle: Text(itemData.description, style: const TextStyle(fontSize: 22)),
            ),
            ListTile(
                title: const Text('${AppStrings.priceLabel}:', style: TextStyle(fontSize: 16)),
                subtitle: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text(
                    'R\$ ${(itemData.price * _quantity).toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 22),
                  ),
                  Row(children: [
                    IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (_quantity > 1) _quantity--;
                          });
                        }),
                    Text('$_quantity', style: const TextStyle(fontSize: 22)),
                    IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            _quantity++;
                          });
                        })
                  ])
                ])),
            CustomElevatedButton(
                value: AppStrings.addOrderLabel,
                onPressed: () {
                  _confirmItem();
                })
          ]),
        ));
  }
}
