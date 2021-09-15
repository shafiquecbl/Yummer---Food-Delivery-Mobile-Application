import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secure_hops/Screens/Onboarding/OnBoarding.dart';
import 'package:secure_hops/constants.dart';

void main() {
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
        home: Onbording(),
      ),
    );
  }
}
