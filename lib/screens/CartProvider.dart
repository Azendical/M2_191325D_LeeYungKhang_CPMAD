import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  Map<int, int> _cart = {};

  //Getters
  Map<int, int> get cart => _cart;

  int get cartCount => _cart.length;
  int get count => _cart.length > 0 ? _cart.values.reduce((a, b) => a + b) : 0;

  //Reduce method - add each value from the list
  void addToCart(index) {
    if (_cart.containsKey(index)) {
      _cart[index] += 1;
    } else {
      _cart[index] = 1;
    }
    //Call this whenever there is some change in any field of change notifier
    notifyListeners();
  }

  void clear(index) {
    if (_cart.containsKey(index)) {
      _cart.remove(index);
      //Call this whenever there is some change in any field of change notifier
      notifyListeners();
    }
  }
}
