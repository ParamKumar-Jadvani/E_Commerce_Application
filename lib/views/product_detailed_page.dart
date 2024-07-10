import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_application/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../utils/utils_product.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _Productdetailpage();
}

class _Productdetailpage extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Map Product = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
        title:
            const Text('Product Detail', style: TextStyle(color: Colors.black)),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: size.height * 0.4,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1,
              ),
              items:
                  (Product['images'] as List<dynamic>).map<Widget>((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            16.toHeight(),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.shade100,
                ),
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(9, 30, 66, 0.25),
                    blurRadius: 8,
                    spreadRadius: -2,
                    offset: Offset(0, -3),
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(9, 30, 66, 0.08),
                    blurRadius: 0,
                    spreadRadius: 1,
                    offset: Offset(0, -1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Product['title'],
                    style: const TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  8.toHeight(),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: Product['rating'].toDouble(),
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      14.toWidth(),
                      Text(
                        Product['rating'].toString(),
                        style: const TextStyle(
                          color: Colors.amber,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  8.toHeight(),
                  Row(
                    children: [
                      const Icon(
                        Icons.arrow_downward_rounded,
                        color: Colors.green,
                      ),
                      Text(
                        "${Product['discountPercentage'].toString()} %",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      15.toWidth(),
                      Text(
                        "\$ ${Product['price'].toString()}",
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  16.toHeight(),
                  Text(
                    Product['description'],
                    style: const TextStyle(
                      fontSize: 16.0,
                      height: 1.5,
                      color: Colors.grey,
                    ),
                  ),
                  16.toHeight(),
                  ElevatedButton(
                    onPressed: () {
                      if (!cartProduct.contains(Product)) {
                        Product['qty'] = 1;
                        cartProduct.add(Product);
                      }
                      Navigator.of(context).pushNamed('CartPage');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${Product['title']} added to cart!'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(27),
                      ),
                    ),
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  10.toHeight(),
                  const Text(
                    'Customer Reviews',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  10.toHeight(),
                  Column(
                    children: (Product['reviews'] as List<dynamic>)
                        .map<Widget>((review) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${review['reviewerName']} - Rating: ${review['rating']}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            review['comment'],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            'Date: ${review['date']}',
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          15.toHeight(),
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
