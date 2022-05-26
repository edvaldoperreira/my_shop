import 'package:flutter/material.dart';
import 'package:my_shop/providers/cart.dart';
import 'package:my_shop/utils/app_routes.dart';
import 'package:my_shop/widgets/badge.dart';
import 'package:provider/provider.dart';
import '../widgets/product_grid.dart';

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _onlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    //final productsProvider = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Shop"),
        actions: [
          PopupMenuButton(
              onSelected: (bool value) => {
                    //productsProvider.showOnlyFavorites(value),
                    setState(() => _onlyFavorites = value)
                  },
              itemBuilder: (ctx) => [
                    const PopupMenuItem(
                      value: false,
                      child: Text("All"),
                    ),
                    const PopupMenuItem(
                      value: true,
                      child: Text("Favorite"),
                    )
                  ]),
          Consumer<Cart>(
            child: IconButton(
              onPressed: () => Navigator.of(context).pushNamed(AppRoutes.cart),
              icon: const Icon(Icons.shopping_cart),
            ),
            builder: (context, cart, child) => Badge(
              value: cart.itemCount.toString(),
              child: child as Widget,
            ),
          )
        ],
      ),
      //body: ProductGrid(productsProvider.items),
      body: ProductGrid(_onlyFavorites),
    );
  }
}
