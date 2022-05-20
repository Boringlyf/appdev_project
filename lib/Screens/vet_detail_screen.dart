import 'package:appdev_project/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/vet_provider.dart';

class VetDetailScreen extends StatelessWidget {
  final String id;
  VetDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final loaded_vet =
        Provider.of<VetProvider>(context, listen: false).findById(id);
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          centerTitle: true,
          backgroundColor: Colors.purple,
          title: Text(
            loaded_vet.title,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Hero(
            tag: 'vetPhoto',
            child: Container(
                width: double.infinity,
                height: 300,
                child: Image.network(
                  loaded_vet.imgUrl,
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: Text(
              loaded_vet.description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
              softWrap: true,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'location:    ${loaded_vet.location}',
            style: TextStyle(
                color: Color.fromARGB(255, 129, 129, 129), fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Contact:   ${loaded_vet.contact_info}',
            style: TextStyle(
                color: Color.fromARGB(255, 129, 129, 129), fontSize: 20),
          ),
        ],
      )),
    );
  }
}
