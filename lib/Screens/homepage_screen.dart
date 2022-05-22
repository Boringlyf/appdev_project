import 'package:appdev_project/provider/ads_provider.dart';
import 'package:appdev_project/widgets/ads_widget.dart';
import 'package:appdev_project/widgets/categories_widget.dart';
import 'package:appdev_project/widgets/favorites_grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomepageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: SingleChildScrollView(
          child: Column(
        children: [
          AdsWidget(),
          SizedBox(
            height: 10,
          ),
          CatergoriesWidget(),
          SizedBox(
            height: 20,
          ),
          FavoritesGridWidget(),
        ],
      )),
    );
  }
}
