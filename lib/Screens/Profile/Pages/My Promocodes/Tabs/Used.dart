import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class Used extends StatefulWidget {
  @override
  _UsedState createState() => _UsedState();
}

class _UsedState extends State<Used> {
  final TextStyle style = TextStyle(color: Colors.black54);
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: InkWell(
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                            color: kCardBackgroundColor,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text('mcdonalds',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500)),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  '50% OFF',
                                  style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              trailing: Icon(
                                Icons.copy,
                                size: 25,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, bottom: 10),
                              child: Row(
                                children: [
                                  Text('Valid until June 30, 2021',
                                      style: style),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
      },
    );
  }
}
