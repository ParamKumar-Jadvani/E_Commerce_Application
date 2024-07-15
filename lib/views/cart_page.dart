import 'package:e_commerce_application/extensions.dart';
import 'package:e_commerce_application/utils/utils_product.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double totalPrice = 0;
  double gst = 0;

  void getTotalPrice() {
    cartProduct.forEach((elem) {
      totalPrice += (elem['price'] * elem['qty']);
    });
    gst = totalPrice * 0.18;
  }

  @override
  void initState() {
    getTotalPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Cart Page'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/', (route) => false);
            },
            icon: const Icon(
              Icons.home_rounded,
              color: Colors.black,
              size: 25,
            ),
          ),
          10.toWidth(),
        ],
      ),
      backgroundColor: Colors.white,
      body: (cartProduct.isEmpty)
          ? Center(
              child: Image.network(
                'https://img.freepik.com/free-vector/empty-cart-concept-illustration_114360-17069.jpg',
                width: size.width * 0.8,
                height: size.height * 0.8,
                fit: BoxFit.contain,
              ),
              // child: Image.asset(
              //   'lib/images/empty_cart.jpg', // Adjust the path as per your project structure
              //   width: size.width * 0.8,
              //   height: size.height * 0.8,
              //   fit: BoxFit.contain,
              // ),
            )
          : Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: cartProduct.map((elem) {
                        return Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              margin: const EdgeInsets.fromLTRB(16, 7, 16, 0),
                              alignment: Alignment.topCenter,
                              width: size.width,
                              height: size.height * 0.2,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                    blurRadius: 28,
                                    spreadRadius: 0,
                                    offset: Offset(0, 14),
                                  ),
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.22),
                                    blurRadius: 10,
                                    spreadRadius: 0,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    width: size.width * 0.25,
                                    height: size.height * 0.13,
                                    child: Image.network(
                                      elem['thumbnail'],
                                      fit: BoxFit.cover,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          color:
                                              Color.fromRGBO(14, 30, 37, 0.12),
                                          blurRadius: 4,
                                          spreadRadius: -5,
                                          offset: Offset(0, 2),
                                        ),
                                        BoxShadow(
                                          color:
                                              Color.fromRGBO(14, 30, 37, 0.32),
                                          blurRadius: 16,
                                          spreadRadius: -5,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 5, 5, 5),
                                      height: size.height * 0.75,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            elem['title'],
                                            style: const TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          5.toHeight(),
                                          Row(
                                            children: [
                                              const Text(
                                                'Price : ',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                "\$${elem['price']}",
                                                style: const TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          5.toHeight(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    elem['qty']--;
                                                    if (elem['qty'] == 0)
                                                      cartProduct.remove(elem);
                                                    else
                                                      getTotalPrice();
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons
                                                      .remove_circle_outline_rounded,
                                                  color: Colors.black,
                                                  size: 16,
                                                ),
                                              ),
                                              3.toWidth(),
                                              Text(
                                                elem['qty'].toString(),
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              3.toWidth(),
                                              ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    elem['qty']++;
                                                    getTotalPrice();
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons
                                                      .add_circle_outline_rounded,
                                                  color: Colors.black,
                                                  size: 16,
                                                ),
                                              ),
                                              4.toWidth(),
                                              ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    cartProduct.remove(elem);
                                                    getTotalPrice();
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons.delete_forever_sharp,
                                                  color: Colors.black,
                                                  size: 16,
                                                ),
                                              ),
                                            ],
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
                Container(
                  height: size.height * 0.3,
                  margin: const EdgeInsets.all(16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(14, 30, 37, 0.12),
                        blurRadius: 4,
                        spreadRadius: -5,
                        offset: Offset(0, 2),
                      ),
                      BoxShadow(
                        color: Color.fromRGBO(14, 30, 37, 0.32),
                        blurRadius: 16,
                        spreadRadius: -5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Price\t\t\t: \$ ${totalPrice.toStringAsFixed(2)}'),
                      Text('GST\t\t\t: \$ ${gst.toStringAsFixed(2)}'),
                      Text(
                          'Bill Amount: \$ ${(totalPrice + gst).toStringAsFixed(2)}'),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Proceed To Check OUT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
