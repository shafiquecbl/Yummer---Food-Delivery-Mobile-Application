import 'package:flutter/material.dart';
import 'package:secure_hops/Screens/Profile/Pages/My%20Favorite/components/CustomCard.dart';

class Resturants extends StatefulWidget {
  @override
  _ResturantsState createState() => _ResturantsState();
}

class _ResturantsState extends State<Resturants> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return CustomCard();
        },
      ),
    );
  }
}
