import 'package:appdev_project/models/cart_model.dart';
import 'package:flutter/foundation.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartModel> _cartItems = {};

  Map<String, CartModel> get cartItems {
    return {..._cartItems};
  }

  int get itemCount {
    return _cartItems.length;
  }

  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, item) {
      total += item.price * item.quantity;
    });
    return total;
  }

  void addItem(String productId, String title, double price) {
    if (_cartItems.containsKey(productId)) {
      // change quantity
      _cartItems.update(
          productId,
          (existingCartModel) => CartModel(
              id: existingCartModel.id,
              title: existingCartModel.title,
              quantity: existingCartModel.quantity + 1,
              price: existingCartModel.price));
    } else {
      _cartItems.putIfAbsent(
          productId,
          () => CartModel(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              quantity: 1));
    }
    notifyListeners();
  }
}
