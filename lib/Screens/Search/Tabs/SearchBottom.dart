import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secure_hops/constants.dart';

class SearchTabs extends StatelessWidget {
  const SearchTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 16, right: 6),
        itemCount: 15,
        itemBuilder: (context, index) {
          return TabCard(
            index: index,
          );
        },
      ),
    );
  }
}

class TabCard extends StatelessWidget {
  final int? index;
  const TabCard({@required this.index});

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
                "ALL",
                style: TextStyle(color: Colors.white),
              ),
            )),
      ],
    );
  }
}
