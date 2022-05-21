import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';
import '../provider/order_provider.dart';
import '../widgets/cart_item_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart_listener = Provider.of<CartProvider>(context, listen: false);
    return Container(
      color: Colors.grey[200],
      child: Column(
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
                      onPressed: () {
                        final order_listener =
                            Provider.of<OrderProvider>(context);
                        order_listener.addOrder(
                            cart_listener.cartItems.values.toList(),
                            cart_listener.totalAmount);
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
                  cart_listener.cartItems.values.toList()[index].id),
            ),
          )
        ],
      ),
    );
  }
}
