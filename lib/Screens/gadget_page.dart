import 'package:appdev_project/provider/gadgets_provider.dart';
import 'package:appdev_project/widgets/gadget_grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';
import '../widgets/badge.dart';
import '../widgets/drawer_widget.dart';
import 'cart_screen.dart';

enum filterOptions { Favorites, All }

class GadgetsPage extends StatefulWidget {
  const GadgetsPage({super.key});

  @override
  State<GadgetsPage> createState() => _GadgetsPageState();
}

class _GadgetsPageState extends State<GadgetsPage> {
  var _showFavoriteOnly = false;
  @override
  Widget build(BuildContext context) {
    final gadget_listener =
        Provider.of<GadgetsProvider>(context, listen: false);
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          actions: [
            PopupMenuButton(
                onSelected: (filterOptions value) {
                  setState(() {
                    if (value == filterOptions.Favorites) {
                      // to display only favorite foods
                      _showFavoriteOnly = true;
                    } else {
                      // to display all foods
                      _showFavoriteOnly = false;
                    }
                  });
                },
                iconSize: 30,
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                itemBuilder: (_) => [
                      PopupMenuItem(
                        child: Text('only Favorites'),
                        value: filterOptions.Favorites,
                      ),
                      PopupMenuItem(
                        child: Text('Show All'),
                        value: filterOptions.All,
                      )
                    ]),
            Consumer<CartProvider>(
              builder: (_, cart, child) => Badge(
                  value: cart.itemCount.toString(),
                  child: IconButton(
                      onPressed: () {
                        // setState(() {});
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (ctx) => CartScreen()));
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Color.fromRGBO(238, 238, 238, 1),
                        size: 35,
                      ))),
            ),
          ],
          centerTitle: true,
          backgroundColor: Colors.purple,
          title: Text(
            "Pet Gadgets",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
          ),
        ),
      ),
      body: GadgetGridWidget(_showFavoriteOnly),
    );
  }
}
