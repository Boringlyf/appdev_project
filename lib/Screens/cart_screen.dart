import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';
import '../widgets/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart_listener = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          centerTitle: true,
          backgroundColor: Colors.purple,
          title: Text(
            "Your Cart",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
          ),
        ),
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          Card(
            color: Colors.purple,
            margin: EdgeInsets.all(15.0),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart_listener.totalAmount}',
                    ),
                    backgroundColor: Colors.white,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'ORDER NOW',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart_listener.itemCount,
              itemBuilder: (context, index) => CartItemWidget(
                  cart_listener.cartItems.values.toList()[index].id,
                  cart_listener.cartItems.values.toList()[index].price,
                  cart_listener.cartItems.values.toList()[index].quantity,
                  cart_listener.cartItems.values.toList()[index].id),
            ),
          )
        ],
      ),
    );
  }
}
