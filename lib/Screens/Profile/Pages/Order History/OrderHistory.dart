import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secure_hops/Widgets/AppBar.dart';
import '../../../../constants.dart';
import 'OrderHistoryCard.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: appBar(context, title: 'Order History'),
        body: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return OrderHistoryCard();
            }));
  }
}
