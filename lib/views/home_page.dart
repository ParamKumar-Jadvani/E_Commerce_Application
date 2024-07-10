import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_application/extensions.dart';
import 'package:e_commerce_application/utils/utils_product.dart';
import 'package:e_commerce_application/widgets/product_data_ui.dart';
import 'package:flutter/material.dart';

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

  String selectedCategory = 'All Products';
  String appliedCategory = 'All Products';
  RangeValues sliderValues = RangeValues(1, 10000);

  List get filteredProducts => appliedCategory == 'All Products'
      ? allProducts.where((product) {
          double price = double.parse(product['price'].toString());
          return price >= sliderValues.start && price <= sliderValues.end;
        }).toList()
      : allProducts
          .where((product) =>
              product['category'] == appliedCategory &&
              double.parse(product['price'].toString()) >= sliderValues.start &&
              double.parse(product['price'].toString()) <= sliderValues.end)
          .toList();

  // List get filteredProducts => appliedCategory == 'All Products'
  //     ? allProducts
  //     : allProducts
  //     .where((product) => product['category'] == appliedCategory)
  //     .toList();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('CartPage');
            },
            icon: const Icon(
              Icons.shopping_cart_rounded,
              color: Colors.black,
              size: 25,
            ),
          ),
          10.toWidth(),
        ],
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
              items: imagesSlider.map(
                (imageUrl) {
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
                },
              ).toList(),
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
                  iconSize: 20,
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
                      value: 'All Products',
                    ),
                    ...categories.map((elem) {
                      return DropdownMenuItem(
                        child: Text(elem.tCase),
                        value: elem,
                      );
                    }),
                  ],
                ),
                15.toWidth(),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      appliedCategory = selectedCategory;
                    });
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.filter_list,
                        color: Colors.blue,
                        size: 20,
                      ),
                      5.toWidth(),
                      const Text(
                        'Apply Filter',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
                10.toWidth(),
                Visibility(
                  visible: (appliedCategory != 'All Products'),
                  child: ActionChip(
                    label: const Text(''),
                    // label: const Text(
                    //   'Clear',
                    //   style: TextStyle(
                    //       color: Colors.blue, fontWeight: FontWeight.bold),
                    // ),
                    avatar: const Icon(
                      Icons.clear_rounded,
                      color: Colors.blue,
                      size: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          30), // Adjust the radius as needed
                      side: const BorderSide(
                          color: Colors
                              .black12), // Adjust the border color as needed
                    ),
                    onPressed: () {
                      setState(() {
                        selectedCategory = "All Products";
                        appliedCategory = "All Products";
                        sliderValues = RangeValues(1, 10000);
                      });
                    },
                  ),
                ),
              ],
            ),
            20.toHeight(),
            Row(
              children: [
                Text(
                  "From\n${sliderValues.start.toInt()}",
                  textAlign: TextAlign.center,
                ),
                Expanded(
                  child: RangeSlider(
                      labels: RangeLabels(
                        sliderValues.start.toInt().toString(),
                        sliderValues.end.toInt().toString(),
                      ),
                      min: 1,
                      max: 10000,
                      values: sliderValues,
                      onChanged: (value) {
                        setState(() {
                          sliderValues = value;
                        });
                      }),
                ),
                Text(
                  "To\n${sliderValues.end.toInt()}",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            30.toHeight(),
            Expanded(
              child: Product_Data_UI(
                  context: context,
                  category: appliedCategory,
                  products: filteredProducts),
            ),
          ],
        ),
      ),
    );
  }
}
