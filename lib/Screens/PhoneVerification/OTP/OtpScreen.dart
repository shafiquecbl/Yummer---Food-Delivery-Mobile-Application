import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secure_hops/Screens/home.dart';
import 'package:secure_hops/Widgets/AppBar.dart';
import 'package:secure_hops/Widgets/navigator.dart';
import 'package:secure_hops/home.dart';
import '../../../Images.dart';
import '../../../constants.dart';
import 'Components/otp_form.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: appBar(context, title: "Verify Your Phone Number"),
        // AppBar(
        //   kBackgroundColor: kBackgroundColor,
        //   title: Text("Verify your phone number",style: TextStyle(color: HeadingColor,fontSize: 18),
        //   ),
        //   leading: IconButton(
        //     icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        //     onPressed: () {
        //       Route route=MaterialPageRoute(builder: (_)=>PhoneverificationScreen());
        //       Navigator.pushReplacement(context, route);
        //     },
        //   ),
        // ),
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    "OTP Verification",
                  ),
                  Text("Enter your OTP code here"),
                  buildTimer(),
                  OtpForm(),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "Didn't receive otp? ",
                        style: TextStyle(color: textColor),
                      ),
                      GestureDetector(
                        onTap: () {
                          // OTP code resend
                          print("Code resended");
                        },
                        child: Text(
                          "Resend.",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: ThemeColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      navigatorPush(context, false, MyHomePage());
                    },
                    child: Stack(
                      children: [
                        Container(
                          child: Image.asset(btn),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 120),
                          child: Text(
                            "VERIFY",
                            style: TextStyle(
                                color: btntextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 30),
          builder: (_, dynamic value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: textColor),
          ),
        ),
      ],
    );
  }
}
