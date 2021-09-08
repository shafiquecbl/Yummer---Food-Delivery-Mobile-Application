import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secure_hops/Images.dart';
import 'package:secure_hops/Widgets/AppBar.dart';
import 'package:secure_hops/Widgets/button.dart';
import 'package:secure_hops/Widgets/navigator.dart';
import 'package:secure_hops/constants.dart';

import 'Tabs/ApplyFilter/ApplyFilter.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: "Filter"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "Sort by",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Text("Ukrainian"),
                  Spacer(),
                  Icon(
                    Icons.check,
                    color: Colors.greenAccent,
                  ),
                ],
              ),
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Text("Ukrainian"),
                  Spacer(),
                ],
              ),
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Text("Ukrainian"),
                  Spacer(),
                ],
              ),
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Text("Ukrainian"),
                  Spacer(),
                ],
              ),
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              "Cuisines",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                MyStatefulWidget(),
                Text("Ukrainian"),
                Spacer(),
                MyStatefulWidget(),
                Text("Ukrainian"),
              ],
            ),
            Row(
              children: [
                MyStatefulWidget(),
                Text("Ukrainian"),
                Spacer(),
                MyStatefulWidget(),
                Text("Ukrainian"),
              ],
            ),
            Row(
              children: [
                MyStatefulWidget(),
                Text("Ukrainian"),
                Spacer(),
                MyStatefulWidget(),
                Text("Ukrainian"),
              ],
            ),
            Row(
              children: [
                MyStatefulWidget(),
                Text("Ukrainian"),
                Spacer(),
                MyStatefulWidget(),
                Text("Ukrainian"),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: MyButton(
                onPressed: () {
                  navigatorPush(context, false, AppplyFilter());
                },
                text: "APPLY",
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return primaryColor;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
