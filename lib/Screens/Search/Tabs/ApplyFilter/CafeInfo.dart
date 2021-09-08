import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

void settingModalBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          child: new Wrap(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Spacer(),
                      Icon(Icons.close),
                    ],
                  ),
                  Text(
                    "croissant cafe",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Qui ex aute ipsum duis. Incididunt adipisicing voluptate laborum",
                    style: TextStyle(color: textColor),
                  ),
                  Row(
                    children: [Icon(Icons.call), Text("+928754565")],
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text("+928754565")
                    ],
                  ),
                  Row(
                    children: [Icon(Icons.email), Text("Hamzadtrhgft@gshgfg")],
                  ),
                  Row(
                    children: [Icon(Icons.call), Text("+928754565")],
                  ),
                ],
              )
            ],
          ),
        );
      });
}
