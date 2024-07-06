import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_application/extensions.dart';
import 'package:e_commerce_application/utils/utilsProduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imagesSlider = [
    'https://imatrix.com/wp-content/uploads/sites/12/2021/03/ecommerce.jpg',
    'https://thumbs.dreamstime.com/b/e-commerce-shopping-cart-filled-products-online-store-interface-image-showcases-ease-convenience-320383855.jpg',
    'https://st.depositphotos.com/1001877/3814/i/450/depositphotos_38143799-stock-photo-e-commerce-shopping-cart-with.jpg',
    'https://emeritus.org/in/wp-content/uploads/sites/3/2024/01/Featured-Images-for-Global-10-1024x536.png'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: size.height * 0.25,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1,
              ),
              items: imagesSlider.map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      alignment: Alignment.center,
                      child: const Text(
                        textAlign: TextAlign.center,
                        'My name Is Product',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26),
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
            20.toHeight(),
            const Text(
              'Products',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            10.toHeight(),
            SizedBox(
              height: size.height * 0.25,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: allProducts.map((elem) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed('ProductDetailPage', arguments: elem);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(5),
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white70,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 10,
                              offset: const Offset(5, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: size.height * 0.11,
                              child: Image(
                                image: NetworkImage(
                                  elem['thumbnail'],
                                ),
                              ),
                            ),
                            10.toHeight(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  elem['title'],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  '\$${elem['price']}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                  ),
                                ),
                                RatingBar.builder(
                                  initialRating: elem['rating'].toDouble(),
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 17,
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {},
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(4),
                                  margin:
                                      const EdgeInsets.fromLTRB(4, 10, 4, 0),
                                  child: const Text(
                                    'BUY NOW',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            10.toHeight(),
            Expanded(
              child: Container(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
