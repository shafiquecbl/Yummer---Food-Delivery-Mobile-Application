import 'package:flutter/material.dart';
import 'package:secure_hops/Images.dart';
import 'package:secure_hops/Widgets/AppBar.dart';
import 'package:secure_hops/Widgets/navigator.dart';
import 'package:secure_hops/constants.dart';
import 'Pages/Add_New_card.dart';
import 'components/card_list.dart';

class PaymentMethod extends StatefulWidget {
  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: appBar(context, title: 'Payment Method'),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Text('Credit Cards'),
                Spacer(),
                TextButton(
                  style: TextButton.styleFrom(primary: Color(0xFFE83939)),
                  onPressed: () {
                    navigatorPush(context, false, AddNewCard());
                  },
                  child: Row(
                    children: [Text('Add'), Icon(Icons.add)],
                  ),
                )
              ],
            ),
          ),
          CardList(),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Card(
              elevation: 0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      children: [
                        Image.asset(
                          applyPay,
                          width: 50,
                          height: 50,
                        ),
                        Text(
                          'Apple Pay',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Card(
              elevation: 0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      children: [
                        Image.asset(
                          paypal,
                          width: 50,
                          height: 50,
                        ),
                        Text(
                          'Pay Pal',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
