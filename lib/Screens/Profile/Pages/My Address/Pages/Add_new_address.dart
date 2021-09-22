import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:secure_hops/API/Api_Services/Api_Manager.dart';
import 'package:secure_hops/Widgets/AppBar.dart';
import 'package:secure_hops/Widgets/button.dart';
import 'package:secure_hops/constants.dart';
import 'package:secure_hops/model/loginResponseModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddNewAddress extends StatefulWidget {
  @override
  _AddNewAddressState createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _mobileTextEditingController =
      TextEditingController();
  final TextEditingController _stateTextEditingController =
      TextEditingController();
  final TextEditingController _cityTextEditingController =
      TextEditingController();
  final TextEditingController _zipTextEditingController =
      TextEditingController();
  final TextEditingController _addressTextEditingController =
      TextEditingController();
  int? radioValue = 0;

  String? usernName;
  String? password;

  // ignore: non_constant_identifier_names

  FocusNode focusNode1 = FocusNode();

  InputBorder? focusedBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor),
  );
  void handleRadioValueChanged(int? value) {
    setState(() {
      radioValue = value;
      if (radioValue == 0) {
        setState(() {});
      }
    });
  }

  listenNode() {
    return focusNode1.addListener(() {
      setState(() {});
    });
  }

  @override
  void initState() {
    getuser().then((value) {
      usernName = value.email;
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    focusNode1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: appBar(context, title: 'Add New Address'),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                box(),
                TextFormField(
                    focusNode: focusNode1,
                    controller: _nameTextEditingController,
                    decoration: InputDecoration(
                      hintText: "Enter place",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: "place",
                    ),
                    validator: (value) {}),
                TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter mobile number",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: "Mobile",
                    ),
                    controller: _mobileTextEditingController,
                    validator: (value) {}),
                TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Enter state code",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: "State Code",
                    ),
                    controller: _stateTextEditingController,
                    validator: (value) {}),
                TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter city Code",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: "City Code",
                    ),
                    keyboardType: TextInputType.number,
                    controller: _cityTextEditingController,
                    validator: (value) {}),
                TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter zip-code",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: "Zip-Code",
                    ),
                    controller: _zipTextEditingController,
                    validator: (value) {}),
                TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter address",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: "New Address",
                    ),
                    controller: _addressTextEditingController,
                    validator: (value) {}),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Radio(
                      activeColor: kPrimaryColor,
                      value: 1,
                      groupValue: radioValue,
                      onChanged: handleRadioValueChanged,
                    ),
                    Text(
                      'Use Current Location',
                      style:
                          new TextStyle(fontSize: 16.0, color: Colors.black54),
                    ),
                  ],
                ),
                box(),
                box(),
                MyButton(
                    text: 'SAVE',
                    onPressed: () async {
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      password = preferences.getString('pass');

                      APIService().addAddress(context,
                          address: _addressTextEditingController.text,
                          adrscode: "1",
                          area: "1",
                          city: _cityTextEditingController.text,
                          country: "1",
                          fullname: _nameTextEditingController.text,
                          lat: "0",
                          long: "0",
                          mobilenum: _mobileTextEditingController.text,
                          state: _stateTextEditingController.text,
                          update: "false",
                          username: usernName,
                          userpass: password,
                          zip: _zipTextEditingController.text);
                    })
              ],
            ),
          )
        ],
      ),
    );
  }

  Color? getColor(bool focus) {
    if (focus) {
      setState(() {});
    }
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
