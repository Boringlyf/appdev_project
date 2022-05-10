import 'package:flutter/foundation.dart';

class PetsModel with ChangeNotifier {
  final String name;
  final String price;
  final String description;

  PetsModel(
      {required this.name, required this.price, required this.description});
}
