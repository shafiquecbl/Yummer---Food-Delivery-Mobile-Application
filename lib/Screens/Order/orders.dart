import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:secure_hops/Screens/Order/CheckOut/checkout.dart';
import 'package:secure_hops/Screens/Profile/Pages/My%20Favorite/components/CustomCard.dart';
import 'package:secure_hops/Widgets/AppBar.dart';
import 'package:secure_hops/Widgets/button.dart';
import 'package:secure_hops/Widgets/navigator.dart';
import 'package:secure_hops/constants.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int value = 0;
  TextStyle style = TextStyle(fontSize: 18, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: MyButton(
              text: 'CHECKOUT',
              onPressed: () {
                navigatorPush(context, false, Checkout());
              }),
        ),
      ),
      appBar: appBar(context, title: 'My Order'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            orderList(),
            SizedBox(
              height: 5,
            ),

            ////////////////////////////////////////////////////////

            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Apply Promocode',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: kPrimaryColor,
                  size: 18,
                ),
              ],
            ),

            ////////////////////////////////////////////////////////

            SizedBox(
              height: 20,
            ),

            ////////////////////////////////////////////////////////

            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Text('Subtotal', style: style),
                  Spacer(),
                  Text('\$76.24', style: style),
                ],
              ),
            ),

            ////////////////////////////////////////////////////////

            SizedBox(
              height: 10,
            ),

            ////////////////////////////////////////////////////////

            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Text('Delivery',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: textColor)),
                  Spacer(),
                  Text('Free',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.green)),
                ],
              ),
            ),

            ////////////////////////////////////////////////////////

            SizedBox(
              height: 10,
            ),

            ////////////////////////////////////////////////////////

            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 40),
              child: Row(
                children: [
                  Text('Total',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  Spacer(),
                  Text('\$76.24',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget orderList() {
    return Expanded(
        child: ListView.separated(
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return ExpansionTile(
          trailing: Container(
            width: 0,
          ),
          tilePadding: EdgeInsets.all(0),
          title: CustomCard(),
          children: List.generate(3, (index) => expandedItems(index)),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
    ));
  }

  Widget expandedItems(int index) {
    return Dismissible(
      key: Key(index.toString()),
      background: slideRightBackground(),
      secondaryBackground: slideLeftBackground(),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Card(
          elevation: 0,
          child: Row(
            children: [
              Container(
                width: 85,
                height: 90,
                color: kCardBackgroundColor,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Chicken Taste',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18)),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            '\$33.9',
                            style: TextStyle(color: textColor),
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
                                    icon: FaIcon(FontAwesomeIcons.minus,
                                        size: 10)),
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
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ////////////// Swipe Right //////////////////

  Widget slideRightBackground() {
    return Container(
      color: Colors.green,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.edit,
              color: Colors.white,
            ),
            Text(
              " Edit",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }

////////////// Swipe Left //////////////////

  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }
}
