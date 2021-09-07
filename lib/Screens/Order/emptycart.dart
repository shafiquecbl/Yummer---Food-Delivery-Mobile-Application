import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secure_hops/constants.dart';

class EmptyCart extends StatefulWidget {
  EmptyCart({Key? key}) : super(key: key);

  @override
  _EmptyCartState createState() => _EmptyCartState();
}

class _EmptyCartState extends State<EmptyCart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
          ),
          Center(
            child: Stack(children: [
              Container(
                height: 300,
                width: 300,
                child: Image.asset("assets/emptycart.png"),
              ),
            ]),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "Your cart is empty!",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "please add something to cart",
            style: TextStyle(color: textColor),
          )
        ],
      ),
    ));
  }
}
