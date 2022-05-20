import 'package:appdev_project/provider/order_provider.dart';
import 'package:appdev_project/widgets/drawer_widget.dart';
import 'package:appdev_project/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final order_listener = Provider.of<OrderProvider>(context);

    return Scaffold(
      drawer: DrawerWidget(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          centerTitle: true,
          backgroundColor: Colors.purple,
          title: Text(
            "Your Orders",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: order_listener.orders.length,
          itemBuilder: (context, index) =>
              OrderItem(order_listener.orders[index])),
    );
  }
}
