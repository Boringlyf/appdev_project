import 'package:appdev_project/Screens/food_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Screens/vet_detail_screen.dart';
import '../models/vet_model.dart';

class VetItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final item = Provider.of<VetModel>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        child: GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => VetDetailScreen(id: item.id))),
          child: Hero(
            tag: 'vetPhoto',
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
                Icon(item.isFavorite ? Icons.favorite : Icons.favorite_outline),
            onPressed: () {
              item.toggleFavoriteStatus();
            },
          ),
          backgroundColor: Colors.black54,
          title: Text(
            item.title,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
