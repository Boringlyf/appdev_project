import 'package:appdev_project/models/vet_model.dart';
import 'package:flutter/foundation.dart';

class VetProvider with ChangeNotifier {
  List<VetModel> _vets = [
    VetModel(
        id: 'v1',
        title: 'AnimalBest',
        contact_info: '1234455644',
        description: ' We will treat your pet like royalty and with care',
        imgUrl:
            'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.C5VBuJOk4oo4fUtfMoLF6wHaHa%26pid%3DApi&f=1',
        location: 'Karachi, Pakistan')
  ];

  List<VetModel> get vets {
    return [..._vets];
  }

  List<VetModel> get favoriteVets {
    return _vets.where((vetId) => vetId.isFavorite).toList();
  }

  VetModel findById(String id) {
    return _vets.firstWhere((element) => element.id == id);
  }
}
