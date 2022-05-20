import 'package:appdev_project/provider/pets_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesGridWidget extends StatelessWidget {
  const FavoritesGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final pet_listener = Provider.of<PetsProvider>(context).favoritePets;
    return Container(
      width: double.infinity,
      color: Colors.red,
      height: 700,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Favorites:",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
