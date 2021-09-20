import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secure_hops/API/Api_Services/Api_Manager.dart';
import 'package:secure_hops/Widgets/AppBar.dart';
import 'package:secure_hops/Widgets/button.dart';
import 'package:secure_hops/model/loginResponseModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  var usercode;

  @override
  void initState() {
    getuser().then((value) {
      usercode = value.userCode.toString();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: focusedBorder,
                      hintText: "Enter old password",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: "Old Password",
                    ),
                    controller: _oldpassTextEditingController,
                    validator: (value) {}),
                box(),
                TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: focusedBorder,
                      hintText: "Enter new password",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: "New PassWord",
                    ),
                    controller: _newpassTextEditingController,
                    validator: (value) {}),
                box(),
                TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: focusedBorder,
                      hintText: "Enter confirm password",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: "Confirm PassWord",
                    ),
                    controller: _cpassTextEditingController,
                    validator: (value) {}),
                box(),
                box(),
                box(),
                MyButton(
                    text: 'SAVE PASSWORD',
                    onPressed: () {
                      APIService().changepass(context,
                          newpass: _newpassTextEditingController.text,
                          oldpass: _oldpassTextEditingController.text,
                          usercode: usercode);
                    })
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget box() {
    return SizedBox(
      height: 25,
    );
  }

  Future<LoginResponseModel> getuser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String res = pref.getString('Login').toString();
    var jsonMap = json.decode(res);
    return LoginResponseModel.fromJson(jsonMap);
  }
}
