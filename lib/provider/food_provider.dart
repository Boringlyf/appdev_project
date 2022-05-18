import 'package:appdev_project/models/food_model.dart';
import 'package:flutter/foundation.dart';

class FoodProvider with ChangeNotifier {
  List<FoodModel> _foods = [
    FoodModel(
        name: 'Pedigree',
        imgUrl:
            'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.petconnection.ie%2FFiles%2F127308%2FImg%2F16%2Fpedigree-chicken-dogfoodx1200.jpg&f=1&nofb=1',
        description: ''' a healthy and nutritious snack
  that keeps your pet performing at there peak and happy''',
        price: '\$19.75'),
    FoodModel(
        imgUrl:
            'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimg.chewy.com%2Fis%2Fimage%2Fcatalog%2F252889_MAIN._AC_SL1500_V1600890954_.jpg&f=1&nofb=1',
        name: 'Portland Pet Food',
        description: 'ginger bread treats that keep your healthy and happy',
        price: '\$20.79'),
    FoodModel(
        imgUrl:
            'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi5.walmartimages.com%2Fasr%2F2683fcdf-8ee3-4cb5-8f07-2efd79e0a2d4_4.f3a46734f2867f592b2a1b51ade0eadf.png&f=1&nofb=1',
        name: 'Friskies Indoor Delights',
        description: '''Flavors of Chicken, Salmon, and Garden greens; to give
         your cat a healthy and balanced diet''',
        price: '\$10.99'),
    FoodModel(
        imgUrl:
            'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi5.walmartimages.com%2Fasr%2Fd718a035-be68-4c25-a6a2-d49cdc402411_2.7cb03eb07f32c51f58d8836ee1c408d9.jpeg%3FodnWidth%3D1000%26odnHeight%3D1000%26odnBg%3Dffffff&f=1&nofb=1',
        name: 'Gourmet pet Rabit Food',
        description:
            '''Rich in Fruits and Veggies pet Rabbits love to eat. Benefical
     Bacteria to keep your rabit strong''',
        price: '\$9.99'),
    FoodModel(
        name: 'Iams',
        description:
            "for mature and adult dog. A chicken and whole grain recipe",
        imgUrl:
            "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi5.walmartimages.com%2Fasr%2F6964ff47-abda-480e-b49f-4b4abfffcbaf.8c7dd054681cf71907033810dc7602f8.jpeg&f=1&nofb=1",
        price: '\$16.95')
  ];

  List<FoodModel> get foods {
    return [..._foods];
  }
}
