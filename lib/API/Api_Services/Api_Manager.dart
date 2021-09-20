import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:secure_hops/model/addressResponseModel.dart';
import 'package:secure_hops/model/adress_model.dart';
import 'package:secure_hops/model/changepasswordModel.dart';
import 'dart:convert';

import 'package:secure_hops/model/loginModel.dart';
import 'package:secure_hops/model/showaddress_model.dart';
import 'package:secure_hops/model/signUpModel.dart';
import 'package:secure_hops/Screens/PhoneVerification/PhoneVerificationScreen.dart';
import 'package:secure_hops/Widgets/navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../home.dart';

class APIService {
  var client = http.Client();
  String baseUrl = 'https://www.ohready1.com';

////////////////////////SIGNUP/////////////////////////

  Future<SignUpModel> sign_up(BuildContext context,
      {useremail,
      username,
      userpass,
      firstname,
      lastname,
      mobileno,
      accounttype,
      from,
      facebookid,
      googleid}) async {
    return await client
        .post(Uri.parse('$baseUrl/api/CustomersApi/signup'),
            body: SignUpModel(
                    accounttype: accounttype,
                    facebookid: facebookid,
                    firstname: firstname,
                    from: from,
                    googleid: googleid,
                    lastname: lastname,
                    mobileno: mobileno,
                    useremail: useremail,
                    username: username,
                    userpass: userpass)
                .toJson())
        .then((response) {
      var result = json.decode(response.body);
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
      SignUpModel signupModel = SignUpModel.fromJson(result);
      return signupModel;
    });
  }
///////////////////////////LOGIN///////////////////////

  Future<LoginModel> login(BuildContext context, {username, userpass}) async {
    return await client
        .post(Uri.parse('$baseUrl/api/CustomersApi/Login'),
            body: LoginModel(username: username, userpass: userpass).toJson())
        .then((response) async {
      var result = json.decode(response.body);

      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('Login', jsonEncode(result));
      pref.setString('pass', userpass);

      print(result);
      if (result['result'] == 'true') {
        Navigator.pop(context);
        navigatorPush(context, false, MyHomePage());
      } else {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: const Text('Wrong email or password!')));
      }
      LoginModel loginmodel = LoginModel.fromJson(result);
      return loginmodel;
    });
  }

/////////////////////////////ADD ADDRESS////////////////////////

  Future<AdressModel> addAddress(BuildContext context,
      {username,
      userpass,
      fullname,
      mobilenum,
      country,
      state,
      city,
      area,
      zip,
      address,
      lat,
      long,
      update,
      adrscode}) async {
    return await client
        .post(Uri.parse('$baseUrl/api/CustomersApi/saveCustomerAddress'),
            body: AdressModel(
                    username: username,
                    userpass: userpass,
                    address: address,
                    adrscode: adrscode,
                    area: area,
                    city: city,
                    country: country,
                    fullname: fullname,
                    lat: lat,
                    long: long,
                    mobilenum: mobilenum,
                    state: state,
                    update: update,
                    zip: zip)
                .toJson())
        .then((response) {
      var result = json.decode(response.body);
      print(result);

      if (result['result'] == 'true') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: const Text('Address Registered!')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: const Text('User not exits!')));
      }

      AdressModel addressmodel = AdressModel.fromJson(result);
      return addressmodel;
    });
  }
  ////////////////////SHOW ADDRESS//////////////////

  Future<List<AdressResponseModel>> showadrs(BuildContext context,
      {username, userpass}) async {
    return await client
        .post(Uri.parse('$baseUrl/api/CustomersApi/getCustomerAddresses'),
            body:
                ShowAdrsModel(username: username, userpass: userpass).toJson())
        .then((response) {
      var result = json.decode(response.body);
      print(result);

      List<AdressResponseModel> jsonMap = (json.decode(response.body) as List)
          .map((e) => AdressResponseModel.fromJson(e))
          .toList();
      return jsonMap;
    });
  }

  ////////////////////Change Password//////////////////////

  Future<ChangePasswordModel> changepass(BuildContext context,
      {oldpass, newpass, usercode}) async {
    return await client
        .post(Uri.parse('$baseUrl/api/CustomersApi/changePassword'),
            body: ChangePasswordModel(
                    oldpass: oldpass, newpass: newpass, usercode: usercode)
                .toJson())
        .then((response) {
      var result = json.decode(response.body);
      print('$result');

      if (result['result'] == 'true') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: const Text('Password changed successfully!')));
      } else if (result['result'] == 'OldPassWrong') {
        Navigator.pop(context);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: const Text('Wrong old password!')));
      }

      ChangePasswordModel jsonMap = json
          .decode(response.body)
          .map((e) => ChangePasswordModel.fromJson(e))
          .toList();
      return jsonMap;
    });
  }
}
