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
      body: Column(
        children: [
          HeaderOfPage(),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  width: double.infinity,
                  height: 150,
                  color: Colors.red,
                  child: AdsWidget(),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  width: double.infinity,
                  height: 150,
                  color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          'Pets:',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Card();
                          })
                    ],
                  ),
                )
              ],
            ),
          )
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
//                         width: 200,
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