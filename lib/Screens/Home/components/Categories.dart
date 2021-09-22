import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 16, right: 6),
        itemCount: 15,
        itemBuilder: (context, index) {
          return Categorycard(
            index: index,
          );
        },
      ),
    );
  }
}

class Categorycard extends StatelessWidget {
  final int? index;
  const Categorycard({@required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.only(right: 10),
          height: 50,
          width: 50,
          child: Image.asset("assets/burger 1.png"),
        ),
      ],
    );
  }
}
