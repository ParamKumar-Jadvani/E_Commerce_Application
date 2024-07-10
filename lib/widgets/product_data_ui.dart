import 'package:e_commerce_application/extensions.dart';
import 'package:e_commerce_application/utils/utils_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget Product_Data_UI({
  required BuildContext context,
  required List products,
  String category = "All",
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        category.tCase,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      10.toHeight(),
      Expanded(
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (context, index) {
            final elem = products[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  'ProductDetailPage',
                  arguments: elem,
                );
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 15,
                      offset: const Offset(5, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(elem['thumbnail']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    10.toHeight(),
                    Text(
                      elem['title'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                    5.toHeight(),
                    Text(
                      '\$${elem['price']}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    5.toHeight(),
                    RatingBarIndicator(
                      rating: elem['rating'].toDouble(),
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemSize: 18,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                    10.toHeight(),
                    ElevatedButton(
                      onPressed: () {
                        if (!cartProduct.contains(elem)) {
                          elem['qty'] = 1;
                          cartProduct.add(elem);
                          print(cartProduct);
                        }
                        setState() {}
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 15),
                      ),
                      child: const Text(
                        'BUY NOW',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
