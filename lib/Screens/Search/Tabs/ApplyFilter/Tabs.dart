import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class FilterTabCard extends StatelessWidget {
  final int? index;
  const FilterTabCard({@required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.only(right: 10),
            height: 30,
            width: 100,
            child: Center(
              child: Text(
                "Most Polpular",
                style: TextStyle(color: Colors.white),
              ),
            )),
      ],
    );
  }
}

class FilterTabs extends StatelessWidget {
  const FilterTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 16, right: 6),
        itemCount: 15,
        itemBuilder: (context, index) {
          return FilterTabCard(
            index: index,
          );
        },
      ),
    );
  }
}
