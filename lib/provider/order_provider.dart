import 'package:appdev_project/models/cart_model.dart';
import 'package:flutter/foundation.dart';

class Order {
  final String id;
  final double amount;
  final List<CartModel> products;
  final DateTime dateTime;

  Order(
      {required this.id,
      required this.amount,
      required this.products,
      required this.dateTime});
}

class OrderProvider with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }

  void addOrder(List<CartModel> cartProducts, double total) {
    _orders.insert(
        0,
        Order(
            id: DateTime.now().toString(),
            amount: total,
            products: cartProducts,
            dateTime: DateTime.now()));
    print("Order Added");
    notifyListeners();
  }
}
