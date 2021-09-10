import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secure_hops/Widgets/AppBar.dart';

import '../../../constants.dart';

class TrackOrder extends StatefulWidget {
  TrackOrder({Key? key}) : super(key: key);

  @override
  _TrackOrderState createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: appBar(context, title: ""),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height / 2,
                width: size.width,
                decoration: BoxDecoration(),
              ),
              Container(
                  height: size.height / 2,
                  width: size.width,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Order Tracking",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                demoAvatar,
                              ),
                              radius: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Ralph Edwards",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Courier",
                                    style: TextStyle(color: textColor),
                                  )
                                ],
                              ),
                            ),
                            Spacer(),
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                "assets/btn call.png",
                              ),
                              radius: 30,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Croissant cafe",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("8000 S Kirkland Ave, Chicago, IL 606..."),
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Courier",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Delivered"),
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Home",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("8000 S Kirkland Ave, Chicago, IL 606..."),
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
