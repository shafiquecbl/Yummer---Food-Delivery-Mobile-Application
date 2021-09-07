import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:secure_hops/Screens/Profile/Pages/My%20Address/Pages/Add_new_address.dart';
import 'package:secure_hops/Screens/Profile/components/divider.dart';
import 'package:secure_hops/Widgets/AppBar.dart';
import 'package:secure_hops/Widgets/button.dart';
import 'package:secure_hops/Widgets/navigator.dart';
import 'package:secure_hops/constants.dart';

class Checkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
          color: kWhiteColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: MyButton(
                text: 'SEND ORDER',
                onPressed: () {
                  navigatorPush(context, false, AddNewAddress());
                }),
          )),
      appBar: appBar(context, title: 'Checkout'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: ListView(
          children: [
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: FaIcon(Icons.backpack_outlined),
                title: Text('My Order'),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        size: 18,
                        color: textColor,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          'Croissant Cafe',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '\$60.95',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: kPrimaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CustomDivider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: FaIcon(
                  Icons.location_pin,
                  color: textColor,
                ),
                title: Text('Delivery Address'),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    '8000 S Kirkland Ave, Chicago, IL 6065...',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            CustomDivider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: FaIcon(
                  Icons.payment_outlined,
                  color: textColor,
                ),
                title: Text('Payment Method'),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    '1234 **** **** 5678',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            CustomDivider(),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'COMMENT',
                style: TextStyle(
                    fontSize: 14,
                    color: textColor,
                    fontWeight: FontWeight.w400),
              ),
            ),

            // Add the comment here
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '',
                style: TextStyle(
                    fontSize: 14,
                    color: textColor,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            CustomDivider(),
          ],
        ),
      ),
    );
  }
}
