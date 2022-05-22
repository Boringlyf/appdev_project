import 'package:appdev_project/provider/food_provider.dart';
import 'package:appdev_project/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';

class FoodDetailScreen extends StatelessWidget {
  final String id;
  FoodDetailScreen({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    final loaded_food =
        Provider.of<FoodProvider>(context, listen: false).findById(id);
    final cart = Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          centerTitle: true,
          backgroundColor: Colors.purple,
          title: Text(
            loaded_food.name,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: 'foodPhoto',
              child: Container(
                  width: double.infinity,
                  height: 300,
                  child: Image.network(
                    loaded_food.imgUrl,
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '\$${loaded_food.price}',
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
                loaded_food.description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
                softWrap: true,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(Icons.add),
        onPressed: () {
          cart.addItem(loaded_food.id, loaded_food.name, loaded_food.price);
          Fluttertoast.showToast(msg: 'Item added', fontSize: 15.0);
        },
      ),
    );
  }
}

// AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.purple,
//         title: Text(loaded_food.name),
//       ),
