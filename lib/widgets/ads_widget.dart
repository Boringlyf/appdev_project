import 'package:appdev_project/provider/ads_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdsWidget extends StatelessWidget {
  const AdsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final adsData = Provider.of<AdsProvider>(context);
    final ads = adsData.ads;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: ((context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Container(
            width: 200,
            height: 100,
            child: Card(
              elevation: 10,
              child: Image.network(ads[index].imageUrl),
            ),
          ),
        );
      }),
    );
  }
}
