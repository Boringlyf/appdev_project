import 'package:appdev_project/provider/order_provider.dart';
import 'package:appdev_project/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';
import '../widgets/cart_item_widget.dart';
import './payment_homepage.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  // void addOrder() {
  //   print('Order Added');
  // }

  @override
  Widget build(BuildContext context) {
    final cart_listener = Provider.of<CartProvider>(context);
    // final PaymentHomescreen payment = new PaymentHomescreen();
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
      drawer: DrawerWidget(),
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
                      '\$${cart_listener.totalAmount.toStringAsFixed(2)}',
                    ),
                    backgroundColor: Colors.white,
                  ),
                  TextButton(
                      onPressed: () async {
                        final order_listener =
                            Provider.of<OrderProvider>(context, listen: false);
                        order_listener.addOrder(
                            cart_listener.cartItems.values.toList(),
                            cart_listener.totalAmount);
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => PaymentScreen(
                                  price: cart_listener.totalAmount)),
                        );
                        cart_listener.clearCart();
                      },
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
                  cart_listener.cartItems.keys.toList()[index],
                  cart_listener.cartItems.values.toList()[index].price,
                  cart_listener.cartItems.values.toList()[index].quantity,
                  cart_listener.cartItems.values.toList()[index].title),
            ),
          )
        ],
      ),
    );
  }
}
