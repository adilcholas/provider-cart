import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_cart/common/theme.dart';
import 'package:provider_cart/provider/cart_provider.dart';
import 'package:provider_cart/models/products_model.dart';

import 'common/routes.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => ProductsModel()),
        ChangeNotifierProxyProvider<ProductsModel, CartProvider>(
          create: (context) => CartProvider(),
          update: (context, products, cart) {
            if (cart == null) throw ArgumentError.notNull('cart');
            cart.catalog = products;
            return cart;
          },
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Provider Cart',
        theme: appTheme,
        routerConfig: router(),
      ),
    );
  }
}