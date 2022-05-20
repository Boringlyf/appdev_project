import 'package:flutter/foundation.dart';

import '../models/pets_model.dart';

class PetsProvider with ChangeNotifier {
  final List<PetsModel> _pets = [
    PetsModel(
        contact: '03110701780',
        id: 'e1',
        name: 'Max',
        location: 'Austin,Texas',
        description:
            ' a 144 cm, 20 ponuds, 2 year old german shepard. he is loves taking walks, and is trained.',
        imgURL:
            'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIF.L1%252fM1xOp6vMa3tw7kByC3Q%26pid%3DApi&f=1'),
    PetsModel(
        contact: '0097455394870',
        id: 'e2',
        name: 'Sera',
        location: 'lahore, Pakistan',
        description:
            ' a 75 cm, 5 pounds, 1.5 year old persian cat. she is fully trained and loves to take long naps in the sun.',
        imgURL:
            'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP._Cv5TdovSCetrgnrUUAFnQHaE8%26pid%3DApi&f=1')
  ];

  List<PetsModel> get pets {
    return [..._pets];
  }

  //to only display list of Favorite foods
  List<PetsModel> get favoritePets {
    return _pets.where((petId) => petId.isfavorite).toList();
  }

  PetsModel findById(String id) {
    return _pets.firstWhere((element) => element.id == id);
  }
}
