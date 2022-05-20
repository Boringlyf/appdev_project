import 'package:appdev_project/provider/pets_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/drawer_widget.dart';

class PetDetailScreen extends StatelessWidget {
  final String id;
  const PetDetailScreen({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    final loaded_pet =
        Provider.of<PetsProvider>(context, listen: false).findById(id);

    return Scaffold(
      drawer: DrawerWidget(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          centerTitle: true,
          backgroundColor: Colors.purple,
          title: Text(
            loaded_pet.name,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Hero(
            tag: 'adoptPhoto',
            child: Container(
                width: double.infinity,
                height: 300,
                child: Image.network(
                  loaded_pet.imgURL,
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: Text(
              loaded_pet.description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
              softWrap: true,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'location:    ${loaded_pet.location}',
            style: TextStyle(
                color: Color.fromARGB(255, 129, 129, 129), fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Contact:   ${loaded_pet.contact}',
            style: TextStyle(
                color: Color.fromARGB(255, 129, 129, 129), fontSize: 20),
          ),
        ],
      )),
    );
  }
}
