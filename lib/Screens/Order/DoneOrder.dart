import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secure_hops/Widgets/button.dart';
import 'package:secure_hops/Widgets/navigator.dart';
import 'package:secure_hops/home.dart';

import '../../constants.dart';
import 'CheckOut/TrackOrder.dart';

class DoneOrder extends StatefulWidget {
  const DoneOrder({Key? key}) : super(key: key);

  @override
  _DoneOrderState createState() => _DoneOrderState();
}

class _DoneOrderState extends State<DoneOrder> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 0.0),
              child: Container(
                child: Image.asset("assets/DoneOrder.png"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 200.0),
            child: Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          child: Text(
                        "Thank you for your order!",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )),
                      Text(
                        "You can track your order by clicking the button below.",
                        style: TextStyle(color: textColor),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyButton(
                          text: "Track My Order",
                          onPressed: () {
                            navigatorPush(context, true, TrackOrder());
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Continue",
                            style: TextStyle(color: textColor),
                          ),
                          TextButton(
                              onPressed: () {
                                navigatorPush(context, false, MyHomePage());
                              },
                              child: Text("Shopping",
                                  style: TextStyle(color: primaryColor)))
                        ],
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    ));
  }
}
