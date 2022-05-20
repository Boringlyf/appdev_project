import 'package:flutter/foundation.dart';

class PetsModel with ChangeNotifier {
  final String id;
  final String name;
  final String location;
  final String description;
  final String imgURL;
  final String contact;

  bool isfavorite;

  PetsModel(
      {required this.id,
      required this.name,
      required this.location,
      required this.description,
      required this.imgURL,
      required this.contact,
      this.isfavorite = false});

  void toggleFavoriteStatus() {
    isfavorite = !isfavorite;
    notifyListeners();
  }
}
