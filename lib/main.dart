import 'package:flutter/material.dart';
import 'package:secure_hops/Screens/Onboarding/OnBoarding.dart';
import 'package:secure_hops/constants.dart';

import 'Widgets/Material Color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yummer',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFFFD5252, color1),
      ),
      home: Onbording(),
    );
  }
}
