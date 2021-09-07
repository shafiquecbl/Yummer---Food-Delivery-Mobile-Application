import 'package:flutter/material.dart';
import 'package:secure_hops/Widgets/Payment_card.dart';

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 199,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 16, right: 6),
        itemCount: 3,
        itemBuilder: (context, index) {
          return PaymentCard(
            index: index,
          );
        },
      ),
    );
  }
}
