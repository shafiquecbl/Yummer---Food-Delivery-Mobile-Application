import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secure_hops/Widgets/AppBar.dart';
import 'components/AllOfferCardList.dart';

class AllOffers extends StatefulWidget {
  AllOffers({Key? key}) : super(key: key);

  @override
  _AllOffersState createState() => _AllOffersState();
}

class _AllOffersState extends State<AllOffers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: "All Offers"),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.symmetric(horizontal: 30),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return AllOfferCardList(
                    index: index,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
