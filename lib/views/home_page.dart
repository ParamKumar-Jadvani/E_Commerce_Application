import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_application/extensions.dart';
import 'package:e_commerce_application/utils/utils_product.dart';
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

  String selectedCategory = 'All';

  // List<Map<String, dynamic>> getFilteredProducts() {
  //   if (selectedCategory == 'All') {
  //     return allProducts;
  //   } else {
  //     return allProducts
  //         .where((product) => product['category'] == selectedCategory)
  //         .toList();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
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
              'Filters',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            10.toHeight(),
            Row(
              children: [
                DropdownButton(
                  value: selectedCategory,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value.toString();
                    });
                  },
                  items: [
                    const DropdownMenuItem(
                      child: Text('All Products'),
                      value: 'All',
                    ),
                    ...categories.map((elem) {
                      return DropdownMenuItem(
                        child: Text(elem),
                        value: elem,
                      );
                    }),
                  ],
                ),
                30.toWidth(),
                ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: const Text(
                      'Apply Filters',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
              ],
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
            Expanded(
              child: GridView.builder(
                itemCount: allProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final elem = allProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        'ProductDetailPage',
                        arguments: elem,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
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
                          Expanded(
                            child: Image.network(
                              elem['thumbnail'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          10.toHeight(),
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
                          10.toHeight(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                cartProduct.add(elem);
                              });
                              Navigator.of(context).pushNamed('CartPage');
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blueAccent,
                              ),
                              child: const Text(
                                'BUY NOW',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
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
        ),
      ),
    );
  }
}
