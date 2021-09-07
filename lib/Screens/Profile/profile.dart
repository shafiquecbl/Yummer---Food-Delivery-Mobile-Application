import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:secure_hops/Screens/Profile/Pages/My%20Address/My_Address.dart';
import 'package:secure_hops/Screens/Profile/Pages/My%20Promocodes/My_Promocodes.dart';
import 'package:secure_hops/Screens/Profile/components/profile_crad.dart';
import 'package:secure_hops/Widgets/navigator.dart';
import 'package:secure_hops/constants.dart';

import 'Pages/My Favorite/My_Favorite.dart';
import 'Pages/Payment Method/payment_method.dart';
import 'components/button_tile.dart';
import 'components/divider.dart';

class Profile extends StatelessWidget {
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
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Text(
                        'My Profile',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: 30),
                    ProfileCard(),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: ListView(
                      children: [
                        TileButton(
                          icon: FaIcon(FontAwesomeIcons.calendar),
                          onPressed: () {},
                          text: 'Order History',
                        ),
                        CustomDivider(),
                        TileButton(
                          icon: FaIcon(Icons.payment),
                          onPressed: () {
                            navigatorPush(context, true, PaymentMethod());
                          },
                          text: 'Payment Method',
                        ),
                        CustomDivider(),
                        TileButton(
                          icon: Icon(Icons.location_pin),
                          onPressed: () {
                            navigatorPush(context, true, MyAddress());
                          },
                          text: 'My Address',
                        ),
                        CustomDivider(),
                        TileButton(
                          icon: FaIcon(FontAwesomeIcons.gift),
                          onPressed: () {
                            navigatorPush(context, true, MyPromocodes());
                          },
                          text: 'My Promocodes',
                        ),
                        CustomDivider(),
                        TileButton(
                          icon: FaIcon(Icons.favorite_outline),
                          onPressed: () {
                            navigatorPush(context, true, MyFavorite());
                          },
                          text: 'My Favorite',
                        ),
                        CustomDivider(),
                        InkWell(
                          onTap: () {},
                          child: ListTile(
                            leading: FaIcon(Icons.logout),
                            title: Text('Signout'),
                          ),
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
