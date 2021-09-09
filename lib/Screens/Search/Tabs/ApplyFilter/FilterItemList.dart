import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secure_hops/constants.dart';

class FilterItemList extends StatelessWidget {
  const FilterItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle style = TextStyle(
      color: Colors.black54,
    );
    return GridView.count(
        childAspectRatio: 0.9,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: List.generate(
            20,
            (index) => Card(
                  color: Colors.amber,
                  child: Center(child: Text('$index')),
                )));
  }
}

class Card extends StatelessWidget {
  const Card({Key? key, required MaterialColor color, required Center child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 130,
            decoration: BoxDecoration(color: textColor),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Caramel cake with beries",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                Text(
                  "\$ 64",
                  style: TextStyle(color: textColor),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
