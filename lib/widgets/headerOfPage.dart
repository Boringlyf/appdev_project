import 'package:flutter/material.dart';

import '../cart_screen.dart';

class HeaderOfPage extends StatelessWidget {
  const HeaderOfPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      color: Colors.deepPurple,
      child: Row(
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              padding: EdgeInsets.all(30.0),
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(
            width: 5.0,
            height: 40,
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => CartScreen()),
                ),
              );
            },
            icon: Icon(Icons.shopping_basket_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border),
          )
        ],
      ),
    );
  }
}
