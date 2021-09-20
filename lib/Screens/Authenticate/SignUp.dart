import 'dart:convert';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:secure_hops/API/Api_Services/Api_Manager.dart';
import 'package:secure_hops/model/signUpModel.dart';

import 'package:secure_hops/Screens/PhoneVerification/PhoneVerificationScreen.dart';
import 'package:secure_hops/Widgets/button.dart';
import 'package:secure_hops/Widgets/loading.dart';
import 'package:secure_hops/Widgets/navigator.dart';
import 'package:secure_hops/home.dart';
import '../../Images.dart';
import '../../constants.dart';
import 'Login.dart';
import 'facebook_login.dart';
import 'google_login.dart';

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

  User? user = FirebaseAuth.instance.currentUser;
  late String facebookId;
  late String googleId;
  late String accountype;

  regiter({@required String? accountType}) async {
    showLoadingDialog(context);
    var data = {
      'email': _emailTextEditingController.text,
      'userName': _nameTextEditingController.text,
      'pass': _passwordTextEditingController.text,
      'firstName': "",
      'lastName': "",
      'accountType': accountType,
      'mobile': "",
      'from': "Mobile App",
      'facebookId': "",
      'googleId': ""
    };

    var client = http.Client();
    try {
      http.Response uriResponse = await client.post(
          Uri.parse('https://www.ohready1.com/api/CustomersApi/signup'),
          body: data);

      var result = json.decode(uriResponse.body);
      print(result);
      if (result['result'] == 'true') {
        Navigator.pop(context);
        navigatorPush(context, false, PhoneverificationScreen());
      } else if (result['result'] == 'alreadyEmail') {
        Navigator.pop(context);
        print("Email already Exist, Use another!");
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: const Text('Email already Exist, Use another!')));
      } else if (result['result'] == 'alreadyName') {
        Navigator.pop(context);
        print("UserName already Exist, Use another!");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('UserName already Exist, Use another!')));
      } else if (result['result'] == 'error') {
        Navigator.pop(context);
        print("Unable to register please try again!");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('Unable to register please try again!')));
      }
    } finally {
      client.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                          TextFormField(
                            controller: _nameTextEditingController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Password';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.redAccent),
                                ),
                                border: UnderlineInputBorder(),
                                labelText: 'User Name'),
                            obscureText: false,
                          ),
                          TextFormField(
                            controller: _emailTextEditingController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter email';
                              }
                              if (!RegExp(
                                      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                  .hasMatch(value)) {
                                return 'Please enter a valid email Address';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.redAccent),
                                ),
                                border: UnderlineInputBorder(),
                                labelText: 'Email'),
                            obscureText: false,
                          ),
                          TextFormField(
                            controller: _passwordTextEditingController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Password';
                              }
                              if (value.trim().length < 4) {
                                return 'Password must be at least 4 characters in length';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.redAccent),
                                ),
                                border: UnderlineInputBorder(),
                                labelText: 'Password'),
                            obscureText: true,
                          ),
                          TextFormField(
                            controller: _cPasswordTextEditingController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter confirm Password';
                              }
                              if (value.trim().length < 4) {
                                return 'Password must be at least 4 characters in length';
                              }
                              if (_passwordTextEditingController.text !=
                                  _cPasswordTextEditingController.text) {
                                return 'Password does not match!';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.redAccent),
                                ),
                                border: UnderlineInputBorder(),
                                labelText: 'Confirm Password'),
                            obscureText: true,
                          ),
                          SizedBox(height: size.height / 14),
                          MyButton(
                              text: "Signup",
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  showLoadingDialog(context);
                                  APIService().sign_up(context,
                                      useremail:
                                          _emailTextEditingController.text,
                                      username: _nameTextEditingController.text,
                                      userpass:
                                          _passwordTextEditingController.text,
                                      firstname: "",
                                      lastname: "",
                                      accounttype: "email",
                                      from: "Mobile",
                                      mobileno: "",
                                      facebookid: "1",
                                      googleid: "1");
                                }
                              }),
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
                                  onTap: () async {
                                    facebookLogin();
                                  },
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
                                    onTap: () async {
                                      showLoadingDialog(context);
                                      try {
                                        await GoogleLogin()
                                            .signInWithGoogle()
                                            .then((value) {
                                          googleId = value.additionalUserInfo!
                                              .profile!['id'];
                                          regiter(accountType: 'google');
                                        });
                                        Navigator.pop(context);
                                        navigatorPush(
                                            context, false, MyHomePage());
                                      } catch (error) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: const Text(
                                                    'Email already Exist, Use another!')));
                                      }
                                    },
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

  facebookLogin() async {
    showLoadingDialog(context);
    try {
      await SocialLogin().signInWithFacebook().then((value) {
        facebookId = value!.additionalUserInfo!.profile!['id'];
        regiter(accountType: 'facebook');
      });
      Navigator.pop(context);
      Navigator.pop(context);

      navigatorPush(context, false, MyHomePage());
    } catch (error) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: const Text('Email already Exist, Use another!')));
    }
  }
}
