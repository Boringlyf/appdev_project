import 'package:flutter/foundation.dart';
// import 'package:provider/provider.dart';

class FoodModel with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imgUrl;

  bool isfavorite;

  FoodModel(
      {required this.name,
      required this.description,
      required this.imgUrl,
      this.id = '',
      required this.price,
      this.isfavorite = false});

  void toggleFavoriteStatus() {
    isfavorite = !isfavorite;
    notifyListeners();
  }
}
