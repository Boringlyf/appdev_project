import 'package:flutter/foundation.dart';

class AdsModel with ChangeNotifier {
  final String id;
  final String title;
  final String imageUrl;
  AdsModel({required this.id, this.title = '', required this.imageUrl});
}
