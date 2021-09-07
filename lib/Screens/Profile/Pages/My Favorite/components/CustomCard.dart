import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class CustomCard extends StatelessWidget {
  final TextStyle style = TextStyle(
    color: Colors.black54,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  title: Text('Chicken Taste',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text('Bakery'),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 10),
                  child: Row(
                    children: [
                      Icon(Icons.star_border_outlined,
                          size: 20, color: Colors.black54),
                      Text('5.0', style: style),
                      Text(' - ', style: style),
                      Icon(Icons.location_pin, size: 20, color: Colors.black54),
                      Text('0.2KM', style: style),
                      Text(' - ', style: style),
                      Text('\$\$', style: style),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
