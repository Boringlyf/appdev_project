import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Screens/pet_detai_screen.dart';
import '../models/pets_model.dart';

class PetItem extends StatelessWidget {
  const PetItem({super.key});

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<PetsModel>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        child: GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PetDetailScreen(id: item.id))),
          child: Hero(
            tag: 'adoptPhoto',
            child: Image.network(
              item.imgURL,
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
