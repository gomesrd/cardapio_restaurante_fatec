import '../models/category_menu.dart';
import '../models/item_menu.dart';

class GenerateMenu {
  static List<CategoryMenu> generateMenu() {
    List<CategoryMenu> list = [
      CategoryMenu('Burgers', [
        ItemMenu('Cheeseburger', 'Hamburguer de carne com queijo cheddar derretido', 'assets/images/menu/cheeseburger.jpg', 15.00),
        ItemMenu('Bacon Burger', 'Hamburguer com bacon crocante e queijo', 'assets/images/menu/hamburguer-bacon.jpg', 18.00),
        ItemMenu('Veggie Burger', 'Hamburguer vegetariano com abacate e queijo', 'assets/images/menu/hamburguer-vegetariano.jpg', 16.50),
        ItemMenu('Double Cheese', 'Hamburguer duplo com queijo e molho especial', 'assets/images/menu/hamburguer-duplo.jpg', 22.00),
        ItemMenu('Chicken Burger', 'Hamburguer de frango empanado com alface e tomate', 'assets/images/menu/hamburguer-duplo.jpg', 14.00)
      ]),
      CategoryMenu('Pizzas', [
        ItemMenu('Pizza Marguerita', 'Molho de tomate, mozzarella fresca e manjericão', 'assets/images/menu/pizza-margherita.jpg', 30.00),
        ItemMenu('Pizza Pepperoni', 'Molho de tomate, mozzarella e pepperoni picante', 'assets/images/menu/pizza-pepperoni.jpg', 35.00),
        ItemMenu('Pizza Quatro Queijos', 'Mistura de quatro queijos deliciosos', 'assets/images/menu/pizza-quatro-queijos.jpg', 33.00),
        ItemMenu('Pizza Portuguesa', 'Presunto, ovos, cebola e azeitonas', 'assets/images/menu/pizza-portuguesa.jpg', 32.00),
        ItemMenu('Pizza Frango com Catupiry', 'Frango desfiado com catupiry e molho de tomate', 'assets/images/menu/pizza-frango.jpg', 36.00)
      ]),
      CategoryMenu('Massas', [
        ItemMenu('Espaguete à Bolonhesa', 'Massa spaghetti com molho bolonhesa', 'assets/images/menu/espaguete-bolonhesa.jpg', 28.00),
        ItemMenu('Fettuccine Alfredo', 'Massa fettuccine com molho branco e queijo parmesão', 'assets/images/menu/fettucine-alfredo.jpg', 30.00),
        ItemMenu('Lasanha', 'Lasanha de carne com molho de tomate e queijo gratinado', 'assets/images/menu/lasanha.jpg', 32.00),
        ItemMenu('Ravioli de Ricota', 'Ravioli recheado com ricota e espinafre', 'assets/images/menu/ravioli-ricota.jpg', 27.00),
        ItemMenu('Espaguete à Carbonara', 'Massa espaguete com bacon e molho carbonara', 'assets/images/menu/espaguete-carbonara.jpg', 29.00)
      ]),
      CategoryMenu('Saladas', [
        ItemMenu('Salada Caesar', 'Alface romana, croutons, queijo parmesão e molho caesar', 'assets/images/menu/salada-caesar.jpg', 20.00),
        ItemMenu('Salada Grega', 'Tomate, pepino, azeitonas, cebola roxa e queijo feta', 'assets/images/menu/salada-grega.jpg', 22.00),
        ItemMenu('Salada Caprese', 'Tomate, mozzarella e manjericão fresco', 'assets/images/menu/salada-caprese.jpg', 18.00),
        ItemMenu('Salada de Frango', 'Frango grelhado, alface, tomate e molho de mostarda', 'assets/images/menu/salada-frango.jpg', 25.00),
        ItemMenu('Salada Tropical', 'Frutas tropicais com folhas verdes e molho especial', 'assets/images/menu/salada-tropical.jpg', 19.00)
      ]),
      CategoryMenu('Sobremesas', [
        ItemMenu( 'Petit Gâteau', 'Bolo de chocolate com sorvete de creme','assets/images/menu/petit-gateau.jpg', 18.00),
        ItemMenu('Pudim', 'Pudim de leite condensado com calda de caramelo', 'assets/images/menu/pudim.jpg', 10.00),
        ItemMenu('Brownie', 'Brownie de chocolate com nozes', 'assets/images/menu/brownie.jpg', 12.00),
        ItemMenu('Torta de Limão', 'Torta de limão com massa crocante', 'assets/images/menu/torta-limao.jpg', 14.00),
        ItemMenu('Sorvete', 'Taça de sorvete de creme com cobertura de chocolate', 'assets/images/menu/sorvete.jpg', 8.00)
      ]),
      CategoryMenu('Bebidas', [
        ItemMenu('Coca-Cola', 'Refrigerante Coca-Cola 350ml', 'assets/images/menu/coca-cola.jpg', 5.00),
        ItemMenu('Suco de Laranja', 'Suco de laranja natural 300ml', 'assets/images/menu/suco-laranja.jpg', 8.00),
        ItemMenu('Água Mineral', 'Água mineral sem gás 600ml', 'assets/images/menu/agua-mineral.jpg', 3.00)
      ]),
    ];

    return list;
  }
}
