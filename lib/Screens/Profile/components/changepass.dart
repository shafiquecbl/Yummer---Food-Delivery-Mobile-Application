import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secure_hops/API/Api_Services/Api_Manager.dart';
import 'package:secure_hops/Provider/user_provider.dart';
import 'package:secure_hops/Widgets/AppBar.dart';
import 'package:secure_hops/Widgets/button.dart';

import '../../../constants.dart';

class ChangePass extends StatefulWidget {
  @override
  _ChangePassState createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  InputBorder? focusedBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor),
  );

  final TextEditingController _oldpassTextEditingController =
      TextEditingController();
  final TextEditingController _newpassTextEditingController =
      TextEditingController();
  final TextEditingController _cpassTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? usercode;
  LoginStorage? loginStorage;

  @override
  void initState() {
    LoginStorage provider = Provider.of(context, listen: false);
    provider.getuser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginStorage>(builder: (context, login, child) {
      loginStorage = login;
      return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: appBar(context, title: 'Change Password'),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.grey[200],
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(70),
                              child: Image.network(
                                demoAvatar,
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            )),
                      ],
                    ),
                  ),
                  box(),
                  Form(
                    key: _formKey,
                    child: Column(children: [
                      TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: focusedBorder,
                          hintText: "Enter old password",
                          hintStyle: TextStyle(color: Colors.grey),
                          labelText: "Old Password",
                        ),
                        controller: _oldpassTextEditingController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter old Password';
                          }
                          if (value.trim().length < 4) {
                            return 'Password must be at least 4 characters in length';
                          }

                          return null;
                        },
                      ),
                      box(),
                      TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: focusedBorder,
                          hintText: "Enter new password",
                          hintStyle: TextStyle(color: Colors.grey),
                          labelText: "New PassWord",
                        ),
                        controller: _newpassTextEditingController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter new Password';
                          }
                          if (value.trim().length < 4) {
                            return 'Password must be at least 4 characters in length';
                          }

                          return null;
                        },
                      ),
                      box(),
                      TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: focusedBorder,
                          hintText: "Enter confirm password",
                          hintStyle: TextStyle(color: Colors.grey),
                          labelText: "Confirm PassWord",
                        ),
                        controller: _cpassTextEditingController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter confirm Password';
                          }
                          if (value.trim().length < 4) {
                            return 'Password must be at least 4 characters in length';
                          }
                          if (_newpassTextEditingController.text !=
                              _cpassTextEditingController.text) {
                            return 'Password does not match!';
                          }
                          return null;
                        },
                      ),
                    ]),
                  ),
                  box(),
                  box(),
                  box(),
                  MyButton(
                      text: 'SAVE PASSWORD',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          APIService().changepass(context,
                              newpass: _newpassTextEditingController.text,
                              oldpass: _oldpassTextEditingController.text,
                              usercode: login.loginResponseModel!.userCode
                                  .toString());
                        }
                      })
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  Widget box() {
    return SizedBox(
      height: 25,
    );
  }
}
