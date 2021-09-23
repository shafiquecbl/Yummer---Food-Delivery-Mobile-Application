import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:secure_hops/Screens/Profile/Pages/My%20Address/My_Address.dart';
import 'package:secure_hops/Screens/Profile/Pages/My%20Address/Pages/Add_new_address.dart';
import 'package:secure_hops/model/addressResponseModel.dart';
import 'package:secure_hops/model/adress_model.dart';
import 'package:secure_hops/model/changepasswordModel.dart';
import 'package:secure_hops/model/deletModel.dart';
import 'package:secure_hops/model/getCustomerProfileModel.dart';
import 'dart:convert';
import 'package:secure_hops/model/loginModel.dart';
import 'package:secure_hops/model/saveProfileModel.dart';
import 'package:secure_hops/model/showaddress_model.dart';
import 'package:secure_hops/model/signUpModel.dart';
import 'package:secure_hops/Widgets/navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../home.dart';

class APIService {
  String baseUrl = 'https://www.ohready1.com';
  var client = http.Client();

////////////////////////SIGNUP/////////////////////////

  Future<SignUpModel> signup(BuildContext context,
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
        .then((response) async {
      var result = json.decode(response.body);
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('Login', jsonEncode(result));
      pref.setString('pass', userpass);
      pref.remove('Profile');
      print(result);
      if (result['result'] == 'true') {
        Navigator.pop(context);
        navigatorPush(context, false, MyHomePage());
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
        Navigator.pop(context);
        // navigatorPush(context, false, MyAddress());
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
  ////////////////////DELETE ADDRESS////////////////////

  // ignore: non_constant_identifier_names
  delete_adrs(BuildContext context, {username, userpass, addresscode}) async {
    return await client
        .post(Uri.parse('$baseUrl/api/CustomersApi/deleteCustomerAddress'),
            body: DeleteModel(
                    userName: username,
                    userPass: userpass,
                    addressCode: addresscode)
                .toJson())
        .then((response) {
      var result = json.decode(response.body);
      print(result);
      if (result['result'] == 'true') {
        Navigator.of(context, rootNavigator: true).pushReplacement(
            MaterialPageRoute(builder: (BuildContext ctx) => MyAddress()));
      }
    });
  }

  ////////////////////Change Password//////////////////////

  changepass(BuildContext context, {oldpass, newpass, usercode}) async {
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
        Navigator.pop(context);
      } else if (result['result'] == 'OldPassWrong') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: const Text('Wrong old password!')));
      }
    });
  }

  ///////////////////SAVE PROFILE///////////////////////

  Future<SaveProfileModel> saveprofile(BuildContext context,
      {email, pass, mobileno, firstName, lastname, gender, dob, img}) async {
    return await client
        .post(Uri.parse('$baseUrl/api/CustomersApi/saveCustomerProfile'),
            body: SaveProfileModel(
                    dob: dob,
                    email: email,
                    firstName: firstName,
                    gender: gender,
                    img: img,
                    lastname: lastname,
                    mobileno: mobileno,
                    pass: pass)
                .toJson())
        .then((response) async {
      var result = json.decode(response.body);

      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString(
          'Profile',
          jsonEncode(SaveProfileModel(
                  dob: dob,
                  email: email,
                  firstName: firstName,
                  gender: gender,
                  img: img,
                  lastname: lastname,
                  mobileno: mobileno,
                  pass: pass)
              .toJson()));
      if (result['result'] == 'true') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: const Text('Changes Saved!')));
      } else if (result['result'] == 'userNotFound') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: const Text('User not found!')));
      }
      SaveProfileModel savepromodel = SaveProfileModel.fromJson(result);
      return savepromodel;
    });
  }

  ////////////////////////GET PROFILE////////////////

  Future<GetCustomerProfileModel> getprofile(
    BuildContext context, {
    email,
    pass,
  }) async {
    return await client.post(
        Uri.parse('$baseUrl/api/CustomersApi/getCustomerProfile'),
        body: {'email': email, 'pass': pass}).then((response) async {
      print(response.body);
      var result = json.decode(response.body);

      print(result);

      GetCustomerProfileModel getpromodel =
          GetCustomerProfileModel.fromJson(result);
      return getpromodel;
    });
  }
}
