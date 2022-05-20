import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/pets_provider.dart';
import 'pet_item.dart';

class PetsGridWidget extends StatelessWidget {
  final bool showFavorites;
  PetsGridWidget({required this.showFavorites, super.key});

  @override
  Widget build(BuildContext context) {
    final pet_provider = Provider.of<PetsProvider>(context);
    final pet = showFavorites ? pet_provider.favoritePets : pet_provider.pets;
    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: pet.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4 / 4,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 30.0),
        itemBuilder: ((context, index) {
          return ChangeNotifierProvider.value(
            value: pet[index],
            child: PetItem(),
          );
        }));
  }
}
