import 'package:appdev_project/provider/ads_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdsWidget extends StatelessWidget {
  const AdsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ad_prov = Provider.of<AdsProvider>(context);
    final adverts = ad_prov.ads;
    return Container(
      height: 200,
      width: double.infinity,
      // color: Colors.red,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: adverts.length,
        itemBuilder: ((context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: InkWell(
                    onTap: () {},
                    child: Card(child: Image.network(adverts[index].imageUrl)),
                  )),
            )),
      ),
    );
  }
}
