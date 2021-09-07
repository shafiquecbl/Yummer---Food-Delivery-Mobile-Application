import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ItemList extends StatelessWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle style = TextStyle(
      color: Colors.black54,
    );
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
                              title: Text('Filada Family Bar',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500)),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  'Assian Food',
                                  style: TextStyle(
                                      color: textColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, bottom: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 10,
                                  ),
                                  Text('0.2 Km -\$\$', style: style),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Icon(
                                      Icons.delivery_dining_outlined,
                                      size: 20,
                                      color: primaryColor,
                                    ),
                                  ),
                                  Text('Free',
                                      style: TextStyle(color: primaryColor)),
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
