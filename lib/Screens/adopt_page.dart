import 'package:appdev_project/widgets/drawer_widget.dart';
import 'package:appdev_project/widgets/pets_grid_widget.dart';
import 'package:flutter/material.dart';

enum filterOptions { Favorites, All }

class AdoptPage extends StatefulWidget {
  const AdoptPage({super.key});

  @override
  State<AdoptPage> createState() => _AdoptPageState();
}

class _AdoptPageState extends State<AdoptPage> {
  var _showFavoritesOnly = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            "Adopt Pets",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
          ),
        ),
      ),
      drawer: DrawerWidget(),
      body: PetsGridWidget(showFavorites: _showFavoritesOnly),
    );
  }
}
