import 'package:flutter/material.dart';
import 'package:secure_hops/Screens/Profile/Pages/My%20Favorite/components/CustomCard.dart';

class Food extends StatefulWidget {
  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return CustomCard();
        },
      ),
    );
  }
}
