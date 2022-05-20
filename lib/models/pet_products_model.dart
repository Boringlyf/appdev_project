import 'package:flutter/foundation.dart';

class PetProducts with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imgUrl;

  bool isfavorite;

  PetProducts(
      {required this.title,
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
