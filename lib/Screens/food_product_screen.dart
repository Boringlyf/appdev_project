import 'package:appdev_project/Screens/cart_screen.dart';
import 'package:appdev_project/provider/food_provider.dart';
import 'package:appdev_project/widgets/drawer_widget.dart';
import 'package:appdev_project/widgets/food_grid_widget.dart';
import 'package:appdev_project/widgets/food_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/food_model.dart';
import '../provider/cart_provider.dart';
import '../widgets/badge.dart';

enum filterOptions { Favorites, All }

class FoodProductScreen extends StatefulWidget {
  FoodProductScreen({super.key});

  @override
  State<FoodProductScreen> createState() => _FoodProductScreenState();
}

class _FoodProductScreenState extends State<FoodProductScreen> {
  var _showFavoritesOnly = false;

  @override
  Widget build(BuildContext context) {
    final food_provider = Provider.of<FoodProvider>(context, listen: false);
    // final food_list = food_provider.foods;
    return Scaffold(
        backgroundColor: Colors.grey[200],
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
                        _showFavoritesOnly = true;
                      } else {
                        // to display all foods
                        _showFavoritesOnly = false;
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => CartScreen()));
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
              "Pet Food",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30),
            ),
          ),
        ),
        body: FoodGridWidget(
          _showFavoritesOnly,
        ));
  }
}
