import 'package:e_commerce_application/views/cart_page.dart';
import 'package:e_commerce_application/views/home_page.dart';
import 'package:e_commerce_application/views/product_detailed_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const HomePage(),
      routes: {
        '/': (context) => const HomePage(),
        'ProductDetailPage': (context) => const ProductDetailPage(),
        'CartPage': (context) => CartPage(),
      },
    );
  }
}
