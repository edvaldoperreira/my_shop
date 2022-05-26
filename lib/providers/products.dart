import 'package:flutter/foundation.dart';
import 'package:my_shop/data/dummy_data.dart';
import 'package:my_shop/models/product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = dummyProducts;

  List<Product> get items => [..._items];

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}
