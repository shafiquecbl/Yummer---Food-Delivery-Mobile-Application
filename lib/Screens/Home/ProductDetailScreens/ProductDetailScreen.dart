import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:secure_hops/Screens/Home/ProductDetailScreens/Content_Product.dart';
import 'package:secure_hops/Screens/Order/order.dart';
import 'package:secure_hops/Widgets/button.dart';

import '../../../constants.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int currentIndex = 0;
  int value = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: MyButton(
              text: "Add To Cart",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Order(),
                  ),
                );
              }),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Column(
                    children: [
                      Stack(children: [
                        Container(
                            height: 400,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(contents[i].image),
                                  fit: BoxFit.cover),
                            )),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 20),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ],
                  );
                },
              ),
            ),
            Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      contents.length,
                      (index) => buildDot(index, context),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  " Caramel Ice-cream with beries",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Qui ex aute ipsum duis. Incididunt adipisicing voluptate laborum",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Text(
                        '\$33.9',
                        style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        ' 350g',
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 35,
                        decoration: BoxDecoration(
                            color: Color(0xFFEEF3FC),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (value > 0) {
                                      value--;
                                    }
                                  });
                                },
                                icon: FaIcon(FontAwesomeIcons.minus, size: 10)),
                            Text('$value'),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    value++;
                                  });
                                },
                                icon: FaIcon(Icons.add, size: 16)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: btncolor,
      ),
    );
  }
}
