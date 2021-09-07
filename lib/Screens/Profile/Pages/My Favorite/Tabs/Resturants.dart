import 'package:flutter/material.dart';

import '../../../../../constants.dart';

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
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Row(
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                      color: kCardBackgroundColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.network(
                    demoAvatar,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
