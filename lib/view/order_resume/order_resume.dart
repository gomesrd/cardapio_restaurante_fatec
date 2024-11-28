import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/show_snack_bar.dart';
import '../../models/order_update.dart';
import '../../service/order/order_service.dart';
import '../../store/order_store.dart';
import '../../utils/messages.dart';
import '../../utils/strings.dart';
import '../../widgets/sized_box_custom.dart';
import '../../widgets/text_custom.dart';

class OrderResumeView extends StatefulWidget {
  const OrderResumeView({super.key});

  @override
  _OrderResumeViewState createState() => _OrderResumeViewState();
}

class _OrderResumeViewState extends State<OrderResumeView> {
  void _confirmOrder(store, context) {
    OrderService().createCategoria();

    if (store.orderMenu.items.isEmpty) return;
    Navigator.pop(context);
    SnackBarHelper.showMessageSuccess(context, AppMessages.orderConfirmedMessage);
    OrderService().updateOrder(
        orderMenuUpdateRequest: OrderMenuUpdate(status: 'FINISHED', items: store.orderMenu.items),
        docId: store.orderId);
    store.clearOrder();
  }

  void _decreaseQuantityItem(item, store) {
    if (item.quantity > 1) {
      store.updateItemQuantity(item, item.quantity - 1);
      OrderService().updateOrder(
          orderMenuUpdateRequest: OrderMenuUpdate(status: store.orderMenu.status, items: store.orderMenu.items),
          docId: store.orderId);
    }
  }

  void _addQuantityItem(item, store) {
    store.updateItemQuantity(item, item.quantity + 1);
    OrderService().updateOrder(
        orderMenuUpdateRequest: OrderMenuUpdate(status: store.orderMenu.status, items: store.orderMenu.items),
        docId: store.orderId);
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<OrderStore>(context);

    return Scaffold(
        appBar: AppBar(
          title: const CustomText(labelText: AppStrings.orderItems),
        ),
        body: Column(children: [
          Expanded(
              child: ListView.builder(
                  itemCount: store.orderMenu.items.length,
                  itemBuilder: (context, index) {
                    final item = store.orderMenu.items[index];
                    return ListTile(
                        title: Text(item.itemName),
                        subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text("${AppStrings.unitPriceLabel}: R\$ ${item.price.toStringAsFixed(2)}"),
                          Text("${AppStrings.amountLabel}: ${item.quantity}"),
                          Text("${AppStrings.totalLabel}: R\$ ${item.totalPrice.toStringAsFixed(2)}"),
                        ]),
                        trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                          IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                _decreaseQuantityItem(item, store);
                              }),
                          Text('${item.quantity}'),
                          IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                _addQuantityItem(item, store);
                              }),
                          IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                store.removeItem(item);
                                OrderService().updateOrder(
                                    orderMenuUpdateRequest:
                                        OrderMenuUpdate(status: store.orderMenu.status, items: store.orderMenu.items),
                                    docId: store.orderId!!);
                              }),
                        ]));
                  })),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: [
                Text(
                  "${AppStrings.generalTotal}: R\$ ${store.total.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const CustomSizedBox(),
                ElevatedButton(
                  onPressed: () {
                    _confirmOrder(store, context);
                  },
                  child: const Text(AppStrings.confirmOrder),
                )
              ]))
        ]));
  }
}
