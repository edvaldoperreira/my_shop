import 'package:flutter/foundation.dart';
import 'package:my_shop/data/dummy_data.dart';
import 'package:my_shop/providers/product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = dummyProducts;
  List<Product> get items => [..._items];
  //bool _onlyFavorites = false;

  // List<Product> get items => _onlyFavorites
  //     ? _items.where((item) => item.isFavorite).toList()
  //     : [..._items];

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }

  // void showOnlyFavorites(bool showFavorites) {
  //   _onlyFavorites = showFavorites;
  //   notifyListeners();
  // }

  void removeProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}
