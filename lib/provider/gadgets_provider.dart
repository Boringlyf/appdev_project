import 'package:appdev_project/models/pet_products_model.dart';
import 'package:flutter/foundation.dart';

class GadgetsProvider with ChangeNotifier {
  List<PetProducts> _gadgets = [
    PetProducts(
        id: 'p1',
        title: 'Squeaky toy',
        description: 'Blue colored dog',
        imgUrl:
            'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi5.walmartimages.com%2Fasr%2Fc34363d1-e133-46db-b751-9b6429fc9abd_1.24c69c02f3271f5f10e439e5e304a6a4.jpeg&f=1&nofb=1',
        price: 19.75),
    PetProducts(
        id: 'p2',
        title: 'Cat Tunnel',
        description: '',
        imgUrl:
            'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.9uHtrAdqeDKP7u7r6SOgDgHaHa%26pid%3DApi&f=1',
        price: 9.99),
    PetProducts(
        id: 'p3',
        title: 'Cat Tower',
        description: 'White, Black, Grey Colors available in this tower',
        imgUrl:
            'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi5.walmartimages.com%2Fasr%2Fc434ccc2-aa62-487a-9f2f-566c95efa974.81db799b09eac7cde0c3775d2ed1ba71.jpeg&f=1&nofb=1',
        price: 30.50),
  ];

  List<PetProducts> get gadgets {
    return [..._gadgets];
  }

  var _showFavoritesOnly = false;

  //to only display list of Favorite foods
  List<PetProducts> get favoriteGadgets {
    return _gadgets.where((prodId) => prodId.isfavorite).toList();
  }

  PetProducts findById(String id) {
    return _gadgets.firstWhere((element) => element.id == id);
  }
}
