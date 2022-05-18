import 'dart:ui';

import 'package:flutter/material.dart';

class FoodItem extends StatelessWidget {
  final String id;
  final String imgUrl;
  final String title;
  FoodItem(
      {required this.id, required this.imgUrl, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        imgUrl,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        leading: IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () {},
        ),
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
        backgroundColor: Colors.black54,
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }
}
