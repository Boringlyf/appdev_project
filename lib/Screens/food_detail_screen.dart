import 'package:appdev_project/provider/food_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodDetailScreen extends StatelessWidget {
  final String id;
  FoodDetailScreen({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    final loaded_food =
        Provider.of<FoodProvider>(context, listen: false).findById(id);
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: Text(loaded_food.name),
      ),
      body: Container(
          width: double.infinity,
          height: 200,
          child: Image.network(loaded_food.imgUrl)),
    );
  }
}
