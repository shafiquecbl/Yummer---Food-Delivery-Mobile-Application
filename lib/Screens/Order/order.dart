import 'package:flutter/material.dart';
import 'package:secure_hops/Screens/Order/emptycart.dart';
import 'package:secure_hops/Screens/Order/orders.dart';
import 'package:secure_hops/Widgets/navigator.dart';
import 'package:secure_hops/constants.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kBackgroundColor,
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(50)),
                  child: IconButton(
                      onPressed: () {
                        navigatorPush(context, true, OrderPage());
                      },
                      icon: Icon(Icons.arrow_forward_ios))),
            )
          ],
        ),
        body: EmptyCart());
  }
}
