import 'package:appdev_project/models/food_model.dart';
import 'package:appdev_project/provider/food_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './food_item.dart';

class FoodGridWidget extends StatelessWidget {
  final bool showOnlyFavorites;
  FoodGridWidget(
    this.showOnlyFavorites,
  );

  @override
  Widget build(BuildContext context) {
    final food_provider = Provider.of<FoodProvider>(context);
    final food =
        showOnlyFavorites ? food_provider.favoriteFoods : food_provider.foods;
    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: 5,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4 / 4,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 30.0),
        itemBuilder: ((context, index) {
          return ChangeNotifierProvider.value(
            value: food[index],
            child: FoodItem(),
          );
        }));
  }
}
