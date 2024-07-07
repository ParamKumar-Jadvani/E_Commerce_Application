import 'package:e_commerce_application/extensions.dart';
import 'package:e_commerce_application/utils/utils_product.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Cart Page'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: cartProduct.map((elem) {
              return Column(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    width: size.width,
                    height: size.height * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          width: size.width * 0.22,
                          height: size.height * 0.75,
                          child: Image.network(
                            elem['thumbnail'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.fromLTRB(0, 5, 5, 5),
                            height: size.height * 0.75,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  elem['title'],
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "\$${elem['price']}",
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.green,
                                  ),
                                ),
                                Text(
                                  elem['description'],
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  15.toHeight(),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
