import 'package:e_commerce_application/views/cartPage.dart';
import 'package:e_commerce_application/views/homePage.dart';
import 'package:e_commerce_application/views/productDetailedPage.dart';
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
        'ProductDetailPage': (context) => const Productdetailpage(),
        'CartPage': (context) => const Cartpage(),
      },
    );
  }
}
