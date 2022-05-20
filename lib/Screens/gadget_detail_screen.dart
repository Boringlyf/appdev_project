import 'package:appdev_project/provider/gadgets_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/drawer_widget.dart';

class GadgetDetailScreen extends StatelessWidget {
  final String id;
  GadgetDetailScreen({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    final loaded_gadgets =
        Provider.of<GadgetsProvider>(context, listen: false).findById(id);
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          centerTitle: true,
          backgroundColor: Colors.purple,
          title: Text(
            loaded_gadgets.title,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: 'petPhoto',
              child: Container(
                  width: double.infinity,
                  height: 300,
                  child: Image.network(
                    loaded_gadgets.imgUrl,
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '\$${loaded_gadgets.price}',
              style: TextStyle(
                  color: Color.fromARGB(255, 36, 36, 36), fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                loaded_gadgets.description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
