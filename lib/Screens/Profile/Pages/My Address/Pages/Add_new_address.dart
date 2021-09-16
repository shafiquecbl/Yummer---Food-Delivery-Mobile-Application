import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:secure_hops/Widgets/AppBar.dart';
import 'package:secure_hops/Widgets/button.dart';
import 'package:secure_hops/constants.dart';
import 'package:http/http.dart' as http;

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

  add_address() async {
    var address = {
      'userName': "abcd",
      'userPass': "123",
      'fullName': _nameTextEditingController,
      'mobileNo': _mobileTextEditingController,
      'countryCode': "1",
      'stateCode': _stateTextEditingController,
      'cityCode': _cityTextEditingController,
      'areaCode': 1,
      'zipCode': _zipTextEditingController,
      'addressText': _addressTextEditingController,
      'locationLat': "00",
      'locationLong': "00",
      'doUpdate': false,
      'addressCode': 1
    };
    var client = http.Client();
    http.Response uriResponse = await client.post(
        Uri.parse('https://www.ohready1.com/api/CustomersApi/signup'),
        body: address);

    var result = json.decode(uriResponse.body);
    print(result);
  }

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
                      hintText: "Enter full name",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: "Full Name",
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
                    decoration: InputDecoration(
                      hintText: "Enter state",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: "State",
                    ),
                    controller: _stateTextEditingController,
                    validator: (value) {}),
                TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter city",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: "City",
                    ),
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
                MyButton(text: 'SAVE', onPressed: () {})
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
}
