import 'package:flutter/foundation.dart';

class VetModel with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String imgUrl;
  final String contact_info;
  final String location;
  bool isFavorite = false;

  VetModel(
      {required this.id,
      required this.title,
      required this.contact_info,
      required this.description,
      required this.imgUrl,
      required this.location});

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
