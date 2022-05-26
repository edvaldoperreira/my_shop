import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/providers/product.dart';

class CartItem {
  final String id;
  final String productId;
  final String title;
  final int quantity;
  final double price;

  const CartItem(
      {required this.id,
      required this.productId,
      required this.title,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
  final Map<String, CartItem> _items = {};
  Map<String, CartItem> get items => {..._items};

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0;
    _items.forEach((key, cart) {
      total += cart.price * cart.quantity;
    });
    return total;
  }

  void removeItem(String productId) {
    _items.remove(productId);
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(product.id, (item) {
        return CartItem(
          productId: item.productId,
          id: item.id,
          price: item.price,
          quantity: item.quantity + 1,
          title: item.title,
        );
      });
    } else {
      _items.putIfAbsent(
          product.id,
          () => CartItem(
                productId: product.id,
                id: Random().nextDouble().toString(),
                title: product.title,
                quantity: 1,
                price: product.price,
              ));
    }
    notifyListeners();
  }
}
