import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:secure_hops/API/Api_Services/Api_Manager.dart';
import 'package:secure_hops/Screens/Profile/Pages/Edit%20Profile/Profile_Edit_Page.dart';
import 'package:secure_hops/Widgets/navigator.dart';
import 'package:secure_hops/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:secure_hops/model/loginResponseModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileCard extends StatefulWidget {
  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  User? user = FirebaseAuth.instance.currentUser;

  String? email;
  String? password;
  String userName = 'Example';
  String userEmail = 'example@gmail.com';

  @override
  void initState() {
    getuser().then((value) {
      email = value.email;
      APIService()
          .getprofile(context, email: email, pass: password)
          .then((value) {
        setState(() {
          userName = '${value.firstName} ${value.lastName}';

          userEmail = value.email.toString();
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            profile(name: '$userName', email: '$userEmail'),
            IconButton(
                onPressed: () {
                  navigatorPush(context, true, ProfileEditPage());
                },
                icon: FaIcon(
                  // Icons.edit
                  FontAwesomeIcons.edit,
                  color: Colors.grey,
                ))
          ],
        ),
      ),
    );
  }

  profile({@required String? name, String? email}) {
    return Expanded(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(demoAvatar
              // user!.photoURL.toString(),
              ),
          radius: 30,
        ),
        title: Text(
          name.toString(),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          email.toString(),
        ),
      ),
    );
  }

  Future<LoginResponseModel> getuser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    password = preferences.getString('pass');
    SharedPreferences pref = await SharedPreferences.getInstance();
    String res = pref.getString('Login').toString();
    var jsonMap = json.decode(res);
    return LoginResponseModel.fromJson(jsonMap);
  }
}
