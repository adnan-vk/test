import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List cartItems = [];
  List cartPrice = [];
  int count = 1;

  void addProductToCart(String product, String price) {
    cartItems.add(product);
    cartPrice.add(price);
    notifyListeners();
  }

  addcount() {
    count++;
    notifyListeners();
  }

  // lesscount(product, price) {
  //   if (count >= 1) {
  //     count--;
  //   } else {
  //     cartItems.remove(product);
  //     cartPrice.remove(price);
  //   }
  //   notifyListeners();
  // }
  lesscount(index) {
    if (count > 1) {
      count--;
    } else {
      cartItems.removeAt(index);
      cartPrice.removeAt(index);
    }
    notifyListeners();
  }
}
