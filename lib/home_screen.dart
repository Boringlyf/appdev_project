import 'package:appdev_project/Screens/cart_page.dart';
import 'package:appdev_project/Screens/cart_screen.dart';
import 'package:appdev_project/Screens/explore_screen.dart';
import 'package:appdev_project/models/ads_model.dart';
import 'package:appdev_project/provider/cart_provider.dart';
import 'package:appdev_project/widgets/ads_widget.dart';
import 'package:appdev_project/widgets/badge.dart';
import 'package:appdev_project/widgets/headerOfPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/homepage_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  final pages = [
    HomepageScreen(),
    CartPage(),
    ExploreScreen(),
    // const Page4(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.purple,
        ),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    pageIndex = 0;
                    setState(() {});
                  },
                  icon: pageIndex == 0
                      ? Icon(
                          Icons.home,
                          color: Colors.grey[200],
                          size: 35,
                        )
                      : Icon(
                          Icons.home_outlined,
                          color: Colors.grey[200],
                          size: 30,
                        )),
              Consumer<CartProvider>(
                builder: (_, cart, child) => Badge(
                  value: cart.itemCount.toString(),
                  child: IconButton(
                      onPressed: () {
                        pageIndex = 1;
                        setState(() {});
                      },
                      icon: pageIndex == 1
                          ? Icon(
                              Icons.shopping_cart,
                              color: Color.fromRGBO(238, 238, 238, 1),
                              size: 35,
                            )
                          : Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.grey[200],
                              size: 30,
                            )),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person_outline,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          centerTitle: true,
          backgroundColor: Colors.purple,
          title: Text(
            "Pet Care",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
          ),
        ),
      ),
      drawer: Drawer(),
      body: pages[pageIndex], //toggle through bottom Navigation bar
    );
  }
}


// body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           children: [
//             Material(
//               elevation: 10,
//               child: Container(
//                 // color: Colors.red,
//                 width: double.infinity,
//                 height: 120,
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       width: double.infinity,
//                       height: 60,
//                     ),
//                     Row(
//                       // mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           width: 140,
//                         ),
//                         Text(
//                           "Pet Care",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.purple,
//                               fontSize: 30),
//                         ),
//                         SizedBox(
//                           width: 40,
//                         ),
//                         IconButton(
//                             onPressed: () {},
//                             icon: Icon(Icons.favorite_border)),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         IconButton(
//                             onPressed: (() {
//                               // cart button
//                             }),
//                             icon: Icon(Icons.shopping_cart))
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),