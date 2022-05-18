import 'package:flutter/foundation.dart';

class FoodModel {
  final String id;
  final String name;
  final String description;
  final String price;
  final String imgUrl;

  bool isfavorite;

  FoodModel(
      {required this.name,
      required this.description,
      required this.imgUrl,
      this.id = '',
      required this.price,
      this.isfavorite = false});
}
