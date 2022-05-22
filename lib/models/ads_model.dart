import 'package:flutter/foundation.dart';

class AdsModel with ChangeNotifier {
  final String id;
  final String imageUrl;
  AdsModel({required this.id, required this.imageUrl});
}
