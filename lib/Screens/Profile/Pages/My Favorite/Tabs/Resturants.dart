import 'package:flutter/material.dart';

class Resturants extends StatefulWidget {
  @override
  _ResturantsState createState() => _ResturantsState();
}

class _ResturantsState extends State<Resturants> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return Text('Resturants');
      },
    );
  }
}
