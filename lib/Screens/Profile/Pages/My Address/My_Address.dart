import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:secure_hops/Screens/Profile/Pages/My%20Address/Pages/Add_new_address.dart';
import 'package:secure_hops/Screens/Profile/components/divider.dart';
import 'package:secure_hops/Widgets/AppBar.dart';
import 'package:secure_hops/Widgets/button.dart';
import 'package:secure_hops/Widgets/navigator.dart';

class MyAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: 'My Address'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: ListView(
          children: [
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: FaIcon(Icons.home_outlined),
                title: Text('Home'),
                subtitle: Text('8000 S Kirkland Ave, Chicago, IL 6065...'),
              ),
            ),
            CustomDivider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: FaIcon(Icons.work_outline),
                title: Text('Work'),
                subtitle: Text('8000 S Kirkland Ave, Chicago, IL 6065...'),
              ),
            ),
            CustomDivider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: FaIcon(Icons.location_pin),
                title: Text('Other'),
                subtitle: Text('8000 S Kirkland Ave, Chicago, IL 6065...'),
              ),
            ),
            CustomDivider(),
            SizedBox(
              height: 30,
            ),
            MyButton(
                text: 'ADD NEW ADDRESS',
                onPressed: () {
                  navigatorPush(context, false, AddNewAddress());
                })
          ],
        ),
      ),
    );
  }
}
