import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/messages.dart';
import '../../widgets/elevated_button_custom.dart';
import '../../widgets/text_custom.dart';
import '../../helpers/show_snack_bar.dart';
import '../../models/item_menu.dart';
import '../../models/order_item.dart';
import '../../store/order_store.dart';
import '../../utils/strings.dart';

class ItemDetailsView extends StatefulWidget {
  const ItemDetailsView({super.key});

  @override
  State<ItemDetailsView> createState() => _ItemDetailsViewState();
}

class _ItemDetailsViewState extends State<ItemDetailsView> {
  int quantity = 1;

  void _decreaseQuantityItem() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

  void _addQuantityItem() {
    setState(() {
      quantity++;
    });
  }

  void _confirmItem(store, itemData) {
    SnackBarHelper.showMessageSuccess(context, AppMessages.itemAddOrderMessage);
    Navigator.pop(context);
    store.addItem(OrderItem(name: itemData.name, quantity: quantity, price: itemData.price));
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<OrderStore>(context);
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
                child: Image.asset(
                  itemData.image,
                  height: MediaQuery.of(context).size.height * 0.3,
                  fit: BoxFit.contain,
                )),
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
                    'R\$ ${(itemData.price * quantity).toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 22),
                  ),
                  Row(children: [
                    IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          _decreaseQuantityItem();
                        }),
                    Text('$quantity', style: const TextStyle(fontSize: 22)),
                    IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          _addQuantityItem();
                        })
                  ])
                ])),
            CustomElevatedButton(
                value: AppStrings.addOrderLabel,
                onPressed: () {
                  _confirmItem(store, itemData);
                })
          ]),
        ));
  }
}
