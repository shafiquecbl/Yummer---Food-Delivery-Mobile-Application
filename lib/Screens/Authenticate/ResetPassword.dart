import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secure_hops/Widgets/AppBar.dart';
import '../../Images.dart';
import '../../constants.dart';
import 'DoneReset.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final TextEditingController _cPasswordTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: appBar(context, title: "Reset Password"),
      // AppBar(
      //   kBackgroundColor: kBackgroundColor,
      //   title: Text("Reset Password",style: TextStyle(
      //     color: Colors.black,
      //   ),),
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back_ios, color: Colors.black),
      //     onPressed: () {
      //       Route route=MaterialPageRoute(builder: (_)=>ForgotPassword());
      //       Navigator.pushReplacement(context, route);
      //     },
      //   ),
      //
      // ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 60.0),
                  child: Text(
                    "Enter New Password and confirm.",
                    style: TextStyle(color: textColor, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: _passwordTextEditingController,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'New Password'),
                    obscureText: true,
                  ),
                ),
                TextField(
                  controller: _cPasswordTextEditingController,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Confirm Password'),
                  obscureText: true,
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: GestureDetector(
                      onTap: () {
                        Route route =
                            MaterialPageRoute(builder: (_) => DoneReset());
                        Navigator.push(context, route);
                      },
                      child: Stack(
                        children: [
                          Container(
                            child: Image.asset(btn),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 50),
                            child: Text(
                              "CHANGE PASSWORD",
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
                    //   child: Text("CHANGE PASSWORD",style: TextStyle(color: Colors.white,fontSize: 15),),
                    //   onPressed: (){
                    //     Route route=MaterialPageRoute(builder: (_)=>DoneReset());
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
      ),
    ));
  }
}
