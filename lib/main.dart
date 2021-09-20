import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secure_hops/Screens/Authenticate/Login.dart';
import 'package:secure_hops/Screens/Onboarding/OnBoarding.dart';
import 'package:secure_hops/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:secure_hops/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/loginResponseModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (BuildContext context) {},
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yummer',
        theme: ThemeData(
          primarySwatch: primaryColor,
        ),
        home: FutureBuilder(
          future: getuser(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Container(
                color: Colors.white,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            return snapshot.data != null ? MyHomePage() : Onbording();
          },
        ),
      ),
    );
  }

  Future<LoginResponseModel> getuser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String res = pref.getString('Login').toString();
    var jsonMap = json.decode(res);
    return LoginResponseModel.fromJson(jsonMap);
  }
}
