import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secure_hops/Screens/Onboarding/OnBoarding.dart';
import 'package:secure_hops/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:secure_hops/home.dart';

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
        home: FirebaseAuth.instance.currentUser != null
            ? MyHomePage()
            : Onbording(),
      ),
    );
  }
}
