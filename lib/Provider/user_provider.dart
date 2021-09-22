import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:secure_hops/model/loginResponseModel.dart';
import 'package:secure_hops/model/saveProfileModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginStorage extends ChangeNotifier {
  LoginResponseModel? loginResponseModel;
  String? password;
  SaveProfileModel? profile;

  getuser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    String login = pref.getString('Login').toString(); //LoginResponse
    var jsonMap = json.decode(login);
    loginResponseModel = LoginResponseModel.fromJson(jsonMap);

    String pass = pref.getString('pass').toString(); //Password
    password = pass;

    String _profile = pref.getString('Profile').toString();
    var jsonMap1 = json.decode(_profile);
    profile = SaveProfileModel.fromJson(jsonMap1);

    notifyListeners();
  }
}
