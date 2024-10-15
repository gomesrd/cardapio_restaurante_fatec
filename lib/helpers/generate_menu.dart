import '../models/category_menu.dart';
import '../models/item_menu.dart';


class GenerateMenu {
  static List<CategoryMenu> generateMenu() {
    List<CategoryMenu> list = [
      CategoryMenu('Burgers', [
        ItemMenu('Cheeseburger', 'Hamburguer de carne com queijo cheddar derretido',
            'https://cdn.pixabay.com/photo/2016/03/05/19/02/hamburger-1238246_960_720.jpg', 15.00),
        ItemMenu('Bacon Burger', 'Hamburguer com bacon crocante e queijo',
            'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_960_720.jpg', 18.00),
        ItemMenu('Veggie Burger', 'Hamburguer vegetariano com abacate e queijo',
            'https://cdn.pixabay.com/photo/2016/03/05/19/02/hamburger-1238246_960_720.jpg', 16.50),
        ItemMenu('Double Cheese', 'Hamburguer duplo com queijo e molho especial',
            'https://cdn.pixabay.com/photo/2016/03/05/19/02/hamburger-1238246_960_720.jpg', 22.00),
        ItemMenu('Chicken Burger', 'Hamburguer de frango empanado com alface e tomate',
            'https://cdn.pixabay.com/photo/2016/12/26/17/28/fast-food-1932466_960_720.jpg', 14.00),
      ]),
      CategoryMenu('Pizzas', [
        ItemMenu('Pizza Margherita', 'Molho de tomate, mozzarella fresca e manjericão',
            'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg', 30.00),
        ItemMenu('Pizza Pepperoni', 'Molho de tomate, mozzarella e pepperoni picante',
            'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg', 35.00),
        ItemMenu('Pizza Quatro Queijos', 'Mistura de quatro queijos deliciosos',
            'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg', 33.00),
        ItemMenu('Pizza Portuguesa', 'Presunto, ovos, cebola e azeitonas',
            'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg', 32.00),
        ItemMenu('Pizza Frango com Catupiry', 'Frango desfiado com catupiry e molho de tomate',
            'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg', 36.00),
      ]),
      CategoryMenu('Massas', [
        ItemMenu('Spaghetti à Bolonhesa', 'Massa spaghetti com molho bolonhesa',
            'https://cdn.pixabay.com/photo/2018/10/22/19/39/spaghetti-3765078_960_720.jpg', 28.00),
        ItemMenu('Fettuccine Alfredo', 'Massa fettuccine com molho branco e queijo parmesão',
            'https://cdn.pixabay.com/photo/2020/09/29/19/39/spaghetti-3765078_960_720.jpg', 30.00),
        ItemMenu('Lasanha', 'Lasanha de carne com molho de tomate e queijo gratinado',
            'https://cdn.pixabay.com/photo/2015/06/19/15/15/pizza-815435_960_720.jpg', 32.00),
        ItemMenu('Ravioli de Ricota', 'Ravioli recheado com ricota e espinafre',
            'https://cdn.pixabay.com/photo/2015/06/19/15/15/pizza-815435_960_720.jpg', 27.00),
        ItemMenu('Penne à Carbonara', 'Massa penne com bacon e molho carbonara',
            'https://cdn.pixabay.com/photo/2020/05/21/07/33/pasta-5192813_960_720.jpg', 29.00),
      ]),
      CategoryMenu('Saladas', [
        ItemMenu('Salada Caesar', 'Alface romana, croutons, queijo parmesão e molho caesar',
            'https://cdn.pixabay.com/photo/2016/12/26/17/28/fast-food-1932466_960_720.jpg', 20.00),
        ItemMenu('Salada Grega', 'Tomate, pepino, azeitonas, cebola roxa e queijo feta',
            'https://cdn.pixabay.com/photo/2016/12/26/17/28/fast-food-1932466_960_720.jpg', 22.00),
        ItemMenu('Salada Caprese', 'Tomate, mozzarella e manjericão fresco',
            'https://cdn.pixabay.com/photo/2016/12/26/17/28/fast-food-1932466_960_720.jpg', 18.00),
        ItemMenu('Salada de Frango', 'Frango grelhado, alface, tomate e molho de mostarda',
            'https://cdn.pixabay.com/photo/2016/12/26/17/28/fast-food-1932466_960_720.jpg', 25.00),
        ItemMenu('Salada Tropical', 'Frutas tropicais com folhas verdes e molho especial',
            'https://cdn.pixabay.com/photo/2016/12/26/17/28/fast-food-1932466_960_720.jpg', 19.00),
      ]),
      CategoryMenu('Sobremesas', [
        ItemMenu(
            'Petit Gâteau',
            'Bolo de chocolate com sorvete de creme',
            'https://cdn.pixabay.com/photo/2017/02/15/10/39/chocolate-souffle-2064654_960_720.jpg',
            18.00),
        ItemMenu('Pudim', 'Pudim de leite condensado com calda de caramelo',
            'https://cdn.pixabay.com/photo/2016/12/26/17/28/fast-food-1932466_960_720.jpg', 10.00),
        ItemMenu('Brownie', 'Brownie de chocolate com nozes',
            'https://cdn.pixabay.com/photo/2014/08/22/20/03/brownies-423144_960_720.jpg', 12.00),
        ItemMenu('Torta de Limão', 'Torta de limão com massa crocante',
            'https://cdn.pixabay.com/photo/2016/11/18/17/52/lemon-pie-1837382_960_720.jpg', 14.00),
        ItemMenu('Sorvete', 'Taça de sorvete de creme com cobertura de chocolate',
            'https://cdn.pixabay.com/photo/2014/12/21/23/34/ice-cream-575543_960_720.jpg', 8.00),
      ]),
      CategoryMenu('Bebidas', [
        ItemMenu('Coca-Cola', 'Refrigerante Coca-Cola 350ml',
            'https://cdn.pixabay.com/photo/2017/01/20/15/06/orange-1995056_960_720.jpg', 5.00),
        ItemMenu('Suco de Laranja', 'Suco de laranja natural 300ml',
            'https://cdn.pixabay.com/photo/2017/01/20/15/06/orange-1995056_960_720.jpg', 8.00),
        ItemMenu('Cerveja', 'Cerveja Pilsen 600ml',
            'https://cdn.pixabay.com/photo/2017/01/20/15/06/orange-1995056_960_720.jpg', 12.00),
        ItemMenu('Água Mineral', 'Água mineral sem gás 500ml',
            'https://cdn.pixabay.com/photo/2017/01/20/15/06/orange-1995056_960_720.jpg', 3.00),
        ItemMenu('Vinho Tinto', 'Vinho tinto seco 750ml',
            'https://cdn.pixabay.com/photo/2017/01/20/15/06/orange-1995056_960_720.jpg', 50.00),
      ]),
    ];

    return list;
  }
}
