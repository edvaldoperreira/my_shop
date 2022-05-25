import 'package:flutter/material.dart';
import 'package:my_shop/utils/app_routes.dart';
import 'package:my_shop/views/product_detail_screen.dart';
import 'package:my_shop/views/products_overview_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Loja',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,
        fontFamily: 'Lato',
      ),
      home: const MyHomePage(),
      routes: {
        AppRoutes.productDetail: (ctx) => const ProductDetailScreen(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductsOverviewScreen();
  }
}
