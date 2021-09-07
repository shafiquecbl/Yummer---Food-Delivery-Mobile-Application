import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secure_hops/Screens/PhoneVerification/PhoneVerificationScreen.dart';
import '../../Images.dart';
import '../../constants.dart';
import 'AuthenticScreen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final TextEditingController _cPasswordTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 70.0, right: 150.0),
                child: Text(
                  "Sign up",
                  style: TextStyle(color: Colors.black, fontSize: 50),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: _nameTextEditingController,
                            decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.redAccent),
                                ),
                                border: UnderlineInputBorder(),
                                labelText: 'Name'),
                            obscureText: false,
                          ),
                          TextField(
                            controller: _emailTextEditingController,
                            decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.redAccent),
                                ),
                                border: UnderlineInputBorder(),
                                labelText: 'Email'),
                            obscureText: false,
                          ),
                          TextField(
                            controller: _passwordTextEditingController,
                            decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.redAccent),
                                ),
                                border: UnderlineInputBorder(),
                                labelText: 'Password'),
                            obscureText: true,
                          ),
                          TextField(
                            controller: _cPasswordTextEditingController,
                            decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.redAccent),
                                ),
                                border: UnderlineInputBorder(),
                                labelText: 'Confirm Password'),
                            obscureText: true,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 50.0),
                              child: GestureDetector(
                                onTap: () {
                                  Route route = MaterialPageRoute(
                                      builder: (_) =>
                                          PhoneverificationScreen());
                                  Navigator.pushReplacement(context, route);
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      child: Image.asset(btn),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, left: 120),
                                      child: Text(
                                        "SIGN UP",
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
                              //   child: Text("SIGN UP",style: TextStyle(color: Colors.white),),
                              //   onPressed: (){
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
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Text("Already have account?",
                                    style: TextStyle(color: Colors.grey)),
                                TextButton(
                                    onPressed: () {
                                      Route route = MaterialPageRoute(
                                          builder: (_) => AuthenticScreen());
                                      Navigator.pushReplacement(context, route);
                                    },
                                    child: Text("Sign in.",
                                        style: TextStyle(
                                            color: Colors.redAccent,
                                            fontWeight: FontWeight.bold))),
                              ],
                            ),
                          ),
                          Divider(
                            height: 1.5,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: new BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: Colors.indigo,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      "assets/facebooklogo.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: new BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.blue,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        "assets/twitter.png",
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: new BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.redAccent,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        "assets/google.png",
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
