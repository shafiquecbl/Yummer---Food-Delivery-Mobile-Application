import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:secure_hops/API/Api_Services/Api_Manager.dart';
import 'package:secure_hops/Screens/Authenticate/Login.dart';
import 'package:secure_hops/Screens/Onboarding/OnBoarding.dart';
import 'package:secure_hops/Screens/Profile/Pages/My%20Address/My_Address.dart';
import 'package:secure_hops/Screens/Profile/Pages/My%20Promocodes/My_Promocodes.dart';
import 'package:secure_hops/Screens/Profile/components/profile_crad.dart';
import 'package:secure_hops/Widgets/navigator.dart';
import 'package:secure_hops/constants.dart';
import 'package:secure_hops/model/loginResponseModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Pages/My Favorite/My_Favorite.dart';
import 'Pages/Order History/OrderHistory.dart';
import 'Pages/Payment Method/payment_method.dart';
import 'components/button_tile.dart';
import 'components/divider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? usernName;
  String? password;

  @override
  void initState() {
    getuser().then((value) {
      usernName = value.email;
      print(usernName);
    });
    super.initState();
  }

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
                          onPressed: () {
                            navigatorPush(context, true, OrderHistory());
                          },
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
                          onPressed: () async {
                            SharedPreferences preferences =
                                await SharedPreferences.getInstance()
                                    .then((value) {
                              password = value.getString('pass');
                              return value;
                            });
                            APIService().showadrs(context,
                                username: usernName, userpass: password);
                            //navigatorPush(context, true, MyPromocodes());
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
                          onTap: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.remove('Login');
                            prefs.remove('pass');
                            Navigator.of(context, rootNavigator: true)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (BuildContext ctx) =>
                                        Onbording()));
                          },
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

  Future<LoginResponseModel> getuser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String res = pref.getString('Login').toString();
    var jsonMap = json.decode(res);
    return LoginResponseModel.fromJson(jsonMap);
  }
}
