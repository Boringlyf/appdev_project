import 'package:appdev_project/widgets/drawer_widget.dart';
import 'package:appdev_project/widgets/vet_grid_widget.dart';
import 'package:flutter/material.dart';

enum filterOptions { Favorites, All }

class VetScreen extends StatefulWidget {
  const VetScreen({super.key});

  @override
  State<VetScreen> createState() => _VetScreenState();
}

class _VetScreenState extends State<VetScreen> {
  var _showFavoritesOnly = false;
  @override
  Widget build(BuildContext context) {
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
          ],
          centerTitle: true,
          backgroundColor: Colors.purple,
          title: Text(
            "Vets",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
          ),
        ),
      ),
      body: VetGridWidget(_showFavoritesOnly),
    );
  }
}
