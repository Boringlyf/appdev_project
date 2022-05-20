import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/gadgets_provider.dart';
import 'gadget_item.dart';

class GadgetGridWidget extends StatelessWidget {
  GadgetGridWidget(
    this.showOnlyFavorites,
  );
  final bool showOnlyFavorites;

  @override
  Widget build(BuildContext context) {
    final gadget_provider = Provider.of<GadgetsProvider>(context);
    final gadget = showOnlyFavorites
        ? gadget_provider.favoriteGadgets
        : gadget_provider.gadgets;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: gadget.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4 / 4,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 30.0),
      itemBuilder: ((context, index) {
        return ChangeNotifierProvider.value(
          value: gadget[index],
          child: GadgetItem(),
        );
      }),
    );
  }
}
