import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secure_hops/Screens/Onboarding/OnBoarding.dart';
import 'package:secure_hops/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:secure_hops/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Provider/user_provider.dart';
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
      child: ChangeNotifierProvider<LoginStorage>(
        create: (context) => LoginStorage(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'OhReady!',
          theme: ThemeData(
            primarySwatch: primaryColor,
          ),
          home: FutureBuilder(
            future: getuser(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              LoginStorage provider =
                  Provider.of<LoginStorage>(context, listen: false);
              provider.getuser();
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
      ),
    );
  }

  getuser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String res = pref.getString('Login').toString();
    var jsonMap = json.decode(res);
    if (jsonMap != null) {
      return LoginResponseModel.fromJson(jsonMap);
    }
    return null;
  }
}
