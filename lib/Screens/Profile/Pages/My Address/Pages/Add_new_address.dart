import 'package:flutter/material.dart';
import 'package:secure_hops/Widgets/AppBar.dart';
import 'package:secure_hops/Widgets/button.dart';
import 'package:secure_hops/constants.dart';

class AddNewAddress extends StatefulWidget {
  @override
  _AddNewAddressState createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  String name = 'Kristin Watson';
  String email = 'kristinwatson@gmail.com';
  int? radioValue = 0;

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
                    initialValue: name,
                    decoration: InputDecoration(
                      hintText: "Enter title",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: "TITLE",
                    ),
                    validator: (value) {}),
                box(),
                TextFormField(
                    initialValue: email,
                    decoration: InputDecoration(
                      hintText: "Enter address",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: "NEW ADDRESS",
                    ),
                    validator: (value) {}),
                box(),
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
