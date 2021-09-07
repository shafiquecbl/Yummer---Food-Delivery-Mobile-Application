import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secure_hops/Widgets/AppBar.dart';
import '../../Images.dart';
import '../../constants.dart';
import 'ResetPassword.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: appBar(context, title: "Forgot Password"),
      // AppBar(
      //   kBackgroundColor: kBackgroundColor,
      //   title: Text("Forgot Password",style: TextStyle(
      //     color: Colors.black,
      //   ),),
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back_ios, color: Colors.black),
      //     onPressed: () {
      //       Route route=MaterialPageRoute(builder: (_)=>AuthenticScreen());
      //       Navigator.pushReplacement(context, route);
      //       },
      //   ),
      //
      // ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Column(
            children: [
              Text(
                "Please enter your email address. You will recieve a link to create a new password via email.",
                style: TextStyle(color: textColor, fontSize: 16),
              ),
              TextField(
                controller: _emailTextEditingController,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: 'Email'),
                obscureText: false,
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: GestureDetector(
                    onTap: () {
                      Route route =
                          MaterialPageRoute(builder: (_) => ResetPassword());
                      Navigator.push(context, route);
                    },
                    child: Stack(
                      children: [
                        Container(
                          child: Image.asset(btn),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 130),
                          child: Text(
                            "SEND",
                            style: TextStyle(
                                color: btntextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  )
                  // ElevatedButton(
                  //   child: Text("SEND",style: TextStyle(color: Colors.white),),
                  //   onPressed: (){
                  //     Route route=MaterialPageRoute(builder: (_)=>ResetPassword());
                  //     Navigator.pushReplacement(context, route);
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //       primary: Colors.redAccent,
                  //       padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                  //       textStyle: TextStyle(
                  //           fontSize: 30,
                  //           fontWeight: FontWeight.bold)),
                  //
                  //
                  // ),
                  ),
            ],
          ),
        ),
      ),
    ));
  }
}
