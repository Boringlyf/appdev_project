import 'package:appdev_project/cart_screen.dart';
import 'package:appdev_project/models/ads_model.dart';
import 'package:appdev_project/widgets/ads_widget.dart';
import 'package:appdev_project/widgets/headerOfPage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Material(
            elevation: 10,
            child: Container(
              // color: Colors.red,
              width: double.infinity,
              height: 120,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 140,
                      ),
                      Text(
                        "Pet Care",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                            fontSize: 30),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.favorite_border)),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                          onPressed: (() {
                            // cart button
                          }),
                          icon: Icon(Icons.shopping_cart))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 20, horizontal: 10),
//                       child: Container(
//                       Color.fromRGBO(244, 67, 54, 1)RGBO(244, 67, 54, 1)00,
//                         height: 100,
//                         color: Colors.red,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 20, horizontal: 10),
//                       child: Container(
//                         width: 200,
//                         height: 100,
//                         color: Colors.red,
//                       ),
//                     ),
//                   ],
//                 )