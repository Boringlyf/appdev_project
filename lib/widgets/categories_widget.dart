import 'package:appdev_project/Screens/food_product_screen.dart';
import 'package:appdev_project/Screens/vet_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Screens/adopt_page.dart';
import '../Screens/gadget_page.dart';

class CatergoriesWidget extends StatelessWidget {
  const CatergoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      // color: Colors.green, color used for alignment
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                'Categories',
                style: TextStyle(
                  fontSize: 25,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 110,
            // color: Colors.yellow,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  //food
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: InkWell(
                      enableFeedback: false,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (ctx) => FoodProductScreen()),
                        );
                      },
                      child: Card(
                        color: Colors.purple[300],
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Column(
                            children: [
                              Container(
                                // color: Colors.pink,
                                width: 70,
                                height: 70,
                                child:
                                    Image(image: AssetImage('assets/food.png')),
                              ),
                              Text(
                                'Food',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  //vet
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => VetScreen())));
                      },
                      child: Card(
                        color: Colors.purple[300],
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Column(
                            children: [
                              Container(
                                // color: Colors.pink,
                                width: 70,
                                height: 70,
                                child:
                                    Image(image: AssetImage('assets/vet.png')),
                              ),
                              Text(
                                'Vet',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  //Gadgets
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => GadgetsPage()),
                        ));
                      },
                      child: Card(
                        color: Colors.purple[300],
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Column(
                            children: [
                              Container(
                                // color: Colors.pink,
                                width: 70,
                                height: 70,
                                child:
                                    Image(image: AssetImage('assets/toys.png')),
                              ),
                              Text(
                                'Gadgets',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  //Adopt
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AdoptPage(),
                        ));
                      },
                      child: Card(
                        color: Colors.purple[300],
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Column(
                            children: [
                              Container(
                                // color: Colors.pink,
                                width: 70,
                                height: 70,
                                child: Image(
                                    image: AssetImage('assets/adopt.png')),
                              ),
                              Text(
                                'Adopt',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
