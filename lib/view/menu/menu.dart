import 'package:cardapio/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../store/order_store.dart';
import '../../utils/routes.dart';
import '../../utils/strings.dart';
import '../login/login.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {

  void _navigateOrderResume() {
    Navigator.pushNamed(context, Routes.orderResume);
  }

  void _handleLogout(store) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginView()),
      (Route<dynamic> route) => false,
    );
    store.clear();
    AuthService().logout();
  }

  void _navigateItemDetailsView(item) {
    Navigator.pushNamed(context, Routes.itemDetails, arguments: item);
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<OrderStore>(context);

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
                          child: Text(
                            "${store.items.length}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          )))
                ]),
                onPressed: () {
                  _navigateOrderResume();
                }),
            IconButton(
                icon: const Icon(Icons.logout, size: 32),
                onPressed: () {
                  _handleLogout(store);
                })
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView.builder(
                itemCount: store.listMenu.length,
                itemBuilder: (context, index) {
                  final category = store.listMenu[index];
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
                          trailing: Text('R\$ ${item.price.toStringAsFixed(2)}',
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          leading: SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.asset(
                                item.image,
                                height: MediaQuery.of(context).size.height * 0.3,
                                fit: BoxFit.contain,
                              )),
                          onTap: () {
                            _navigateItemDetailsView(item);
                          });
                    }).toList())
                  ]));
                })));
  }
}
