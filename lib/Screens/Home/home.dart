import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/DeliverCard.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * .27,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/img.png'), fit: BoxFit.cover),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 80),
                child: DeliverCard()),
          ],
        ));
  }
}
