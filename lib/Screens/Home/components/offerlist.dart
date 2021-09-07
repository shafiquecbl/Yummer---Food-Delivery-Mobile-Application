import 'package:flutter/material.dart';

import 'package:secure_hops/constants.dart';

class Offercard extends StatelessWidget {
  final int? index;
  const Offercard({@required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 150,
      width: 300,
      child: Stack(
        children: <Widget>[
          Image.asset("assets/offer img.png"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 20),
                child: Text(
                  "Make Your First \n Order Here",
                  style: TextStyle(
                      color: btntextColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 20),
                child: Text(
                  "50% OFF",
                  style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 7.0, left: 200),
                child: Container(
                  decoration: BoxDecoration(color: primaryColor),
                  height: 30,
                  width: 100,
                  child: Center(
                    child: Text(
                      "Free Delivery",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
