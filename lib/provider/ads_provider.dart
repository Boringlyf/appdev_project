import 'package:appdev_project/models/ads_model.dart';
import 'package:flutter/foundation.dart';

class AdsProvider with ChangeNotifier {
  List<AdsModel> _ads = [
    AdsModel(
        id: '0001',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRh6nCu8wmhPjtM7j_Vb3Z_bbPYuwGzft3CCViUlIG61gQrKsGlh7pFz1U8wWRoBaRKkM0&usqp=CAU'),
    AdsModel(
        id: '0002',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTCmFDW-3balzsSEkasF2cPlA6_QKV8D1hQw&usqp=CAU'),
    AdsModel(
        id: '0003',
        imageUrl:
            'https://i.pinimg.com/originals/59/8f/6d/598f6d125587e1fae7a5b104a9aa1760.jpg'),
    AdsModel(
        id: '0004',
        imageUrl: 'https://i.ytimg.com/vi/kHAbdzMyZIM/maxresdefault.jpg')
  ];

  List<AdsModel> get ads {
    return [..._ads];
  }
}
