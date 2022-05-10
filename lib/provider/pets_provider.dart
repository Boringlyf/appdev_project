import 'package:flutter/foundation.dart';

import '../models/pets_model.dart';

class PetsProvider with ChangeNotifier {
  final List<PetsModel> _pets = [];

  List<PetsModel> get pets {
    return [..._pets];
  }
}
