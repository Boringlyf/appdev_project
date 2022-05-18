import 'dart:ui';

import 'package:appdev_project/Screens/food_detail_screen.dart';
import 'package:appdev_project/models/food_model.dart';
import 'package:appdev_project/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final item = Provider.of<FoodModel>(context);
    final cart = Provider.of<CartProvider>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: ((context) => FoodDetailScreen(
                        id: item.id,
                      ))),
            );
          },
          child: Hero(
            tag: 'foodPhoto',
            child: Image.network(
              item.imgUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        footer: GridTileBar(
          leading: IconButton(
            color: Color.fromARGB(255, 255, 17, 0),
            icon:
                Icon(item.isfavorite ? Icons.favorite : Icons.favorite_outline),
            onPressed: () {
              item.toggleFavoriteStatus();
            },
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              cart.addItem(item.id, item.name, item.price);
            },
          ),
          backgroundColor: Colors.black54,
          title: Text(
            item.name,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
