import 'package:appdev_project/Screens/pet_detai_screen.dart';
import 'package:appdev_project/provider/gadgets_provider.dart';
import 'package:appdev_project/provider/pets_provider.dart';
import 'package:appdev_project/provider/vet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Screens/gadget_detail_screen.dart';
import '../Screens/vet_detail_screen.dart';

class FavoritesGridWidget extends StatelessWidget {
  const FavoritesGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final pet_listener = Provider.of<PetsProvider>(context).favoritePets;
    final gadget_listener =
        Provider.of<GadgetsProvider>(context).favoriteGadgets;
    final vet_listener = Provider.of<VetProvider>(context).favoriteVets;
    return Container(
      width: double.infinity,
      // color: Colors.red,
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
            Container(
              height: 200,
              width: double.infinity,
              // color: Colors.yellow,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(12),
                    child: Text(
                      'Pets:',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: pet_listener.length,
                        itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: InkWell(
                                    onTap: () {},
                                    child: GestureDetector(
                                      onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PetDetailScreen(
                                                      id: pet_listener[index]
                                                          .id))),
                                      child: Card(
                                          child: Image.network(
                                              pet_listener[index].imgURL)),
                                    ),
                                  )),
                            )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: double.infinity,
              // color: Colors.yellow,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(12),
                    child: Text(
                      'Gadgets:',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: gadget_listener.length,
                        itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: InkWell(
                                    onTap: () {},
                                    child: GestureDetector(
                                      onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  GadgetDetailScreen(
                                                      id: gadget_listener[index]
                                                          .id))),
                                      child: Card(
                                          child: Image.network(
                                              gadget_listener[index].imgUrl)),
                                    ),
                                  )),
                            )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: double.infinity,
              // color: Colors.yellow,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(12),
                    child: Text(
                      'Vets:',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: vet_listener.length,
                        itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: InkWell(
                                    onTap: () {},
                                    child: GestureDetector(
                                      onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  VetDetailScreen(
                                                      id: vet_listener[index]
                                                          .id))),
                                      child: Card(
                                          child: Image.network(
                                              vet_listener[index].imgUrl)),
                                    ),
                                  )),
                            )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
