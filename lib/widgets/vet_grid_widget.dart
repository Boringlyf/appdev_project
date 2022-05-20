import 'package:appdev_project/widgets/vet_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/vet_provider.dart';

class VetGridWidget extends StatelessWidget {
  final bool showOnlyFavorites;
  VetGridWidget(
    this.showOnlyFavorites,
  );

  @override
  Widget build(BuildContext context) {
    final vet_provider = Provider.of<VetProvider>(context);
    final vet =
        showOnlyFavorites ? vet_provider.favoriteVets : vet_provider.vets;
    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: vet.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4 / 4,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 30.0),
        itemBuilder: ((context, index) {
          return ChangeNotifierProvider.value(
            value: vet[index],
            child: VetItem(),
          );
        }));
  }
}
