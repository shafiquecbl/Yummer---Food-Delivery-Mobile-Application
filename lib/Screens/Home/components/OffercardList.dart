import 'package:flutter/cupertino.dart';

import 'offerlist.dart';

class Offercardlist extends StatelessWidget {
  const Offercardlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 16, right: 6),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Offercard(
            index: index,
          );
        },
      ),
    );
  }
}
