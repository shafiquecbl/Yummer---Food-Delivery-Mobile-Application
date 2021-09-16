import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;
import 'package:secure_hops/API/Api_Services/Api_Manager.dart';
import 'package:secure_hops/API/Api_Services/loginModel.dart';
import 'package:secure_hops/Widgets/button.dart';
import 'package:secure_hops/Widgets/loading.dart';
import 'package:secure_hops/Widgets/navigator.dart';
import 'package:secure_hops/Widgets/progresshub.dart';
import 'package:secure_hops/home.dart';
import '../../Images.dart';
import '../../constants.dart';
import 'ForgotPassword.dart';
import 'SignUp.dart';
import 'facebook_login.dart';
import 'google_login.dart';

class AuthenticScreen extends StatefulWidget {
  const AuthenticScreen({Key? key}) : super(key: key);

  @override
  _AuthenticScreenState createState() => _AuthenticScreenState();
}

class _AuthenticScreenState extends State<AuthenticScreen> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool hidePassword = true;
  bool isApiCallProcess = false;
  late String googleId;
  late String facebookId;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  _login() async {
    showLoadingDialog(context);
    var data = {
      'userName': _emailTextEditingController.text,
      'pass': _passwordTextEditingController.text,
    };

    var client = http.Client();
    try {
      http.Response response = await client.post(
          Uri.parse('https://www.ohready1.com/api/CustomersApi/login'),
          body: data);

      if (response.statusCode == 200 || response.statusCode == 400) {
        var result = json.decode(response.body);
        print(result);

        if (result['result'] == 'true') {
          Navigator.pop(context);
          navigatorPush(context, false, MyHomePage());
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: const Text('Wrong email or password!')));
        }
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
                    "Sign in",
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
                                border: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.redAccent)),
                                labelText: 'Email/UserName',
                              ),
                              cursorColor: Colors.redAccent,
                              obscureText: false,
                            ),
                            TextFormField(
                              controller: _passwordTextEditingController,
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
                                labelText: 'Password',

                                // suffixIcon: IconButton(onPressed: onPressed, icon: icon)
                              ),
                              obscureText: true,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 138.0),
                              child: TextButton(
                                  onPressed: () {
                                    Route route = MaterialPageRoute(
                                        builder: (_) => ForgotPassword());
                                    Navigator.push(context, route);
                                  },
                                  child: Text(
                                    "Forgot your password?",
                                    style: TextStyle(color: Colors.redAccent),
                                  )),
                            ),
                            SizedBox(
                              height: size.height / 10,
                            ),
                            MyButton(
                                text: "Signin",
                                onPressed: () async {
                                  navigatorPush(context, false, MyHomePage());
                                  // if (_formKey.currentState!.validate()) {
                                  //   _login();
                                  // }
                                }),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Text("Don't have account?",
                                      style: TextStyle(color: Colors.grey)),
                                  TextButton(
                                      onPressed: () {
                                        Route route = MaterialPageRoute(
                                            builder: (_) => SignUp());
                                        Navigator.push(context, route);
                                      },
                                      child: Text("Sign up.",
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
                                      showLoadingDialog(context);
                                      try {
                                        await SocialLogin()
                                            .signInWithFacebook()
                                            .then((value) {
                                          facebookId = value!
                                              .additionalUserInfo!
                                              .profile!['id'];
                                          _login();
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
                                            _login();
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
      ),
    );
  }
}
