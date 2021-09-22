import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:secure_hops/API/Api_Services/Api_Manager.dart';
import 'package:secure_hops/Screens/Profile/components/changepass.dart';
import 'package:secure_hops/Widgets/AppBar.dart';
import 'package:secure_hops/Widgets/button.dart';
import 'package:secure_hops/Widgets/navigator.dart';
import 'package:secure_hops/constants.dart';
import 'package:secure_hops/model/loginResponseModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEditPage extends StatefulWidget {
  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  String? email;
  String? pass;
  String? dropdownValue;
  double? _height;
  double? _width;

  String? _setTime, _setDate;

  String? _hour, _minute, _time;

  File? file;
  String? setDate;

  String? dateTime;
  String? dateofbirth;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _dateController = TextEditingController();

  final TextEditingController _firstnameTextEditingController =
      TextEditingController();
  final TextEditingController _lastnameTextEditingController =
      TextEditingController();
  final TextEditingController _phoneTextEditingController =
      TextEditingController();
  String? gender;

  InputBorder? focusedBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor),
  );
  @override
  @override
  void initState() {
    getuser().then((value) {
      email = value.email;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: appBar(context, title: 'Edit Profile'),
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
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 4, color: Colors.white),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF7D849A),
                                ),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onTap: () async {
                              return showDialog(
                                  context: context,
                                  builder: (con) {
                                    return SimpleDialog(
                                      title: Text(
                                        "Select image from",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      children: [
                                        SimpleDialogOption(
                                          child: Text(
                                            "camera",
                                            style:
                                                TextStyle(color: primaryColor),
                                          ),
                                          onPressed: () {
                                            capturephotowithcamera();
                                          },
                                        ),
                                        Divider(
                                          height: 2,
                                        ),
                                        SimpleDialogOption(
                                          child: Text(
                                            "gallery",
                                            style:
                                                TextStyle(color: primaryColor),
                                          ),
                                          onPressed: () {
                                            selectfromgallery();
                                          },
                                        ),
                                        Divider(
                                          height: 2,
                                        ),
                                        SimpleDialogOption(
                                          child: Text(
                                            "cancel",
                                            style: TextStyle(
                                                color: primaryColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                          )),
                    ],
                  ),
                ),
                box(),
                Text(
                  email.toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: focusedBorder,
                      hintText: "Enter First Name",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: "FIRST NAME",
                    ),
                    controller: _firstnameTextEditingController,
                    validator: (value) {}),
                box(),
                TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: focusedBorder,
                      hintText: "Enter Last Name",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: "LAST NAME",
                    ),
                    controller: _lastnameTextEditingController,
                    validator: (value) {}),
                box(),
                TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: focusedBorder,
                      hintText: "Enter phone #",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: "PHONE NUMBER",
                    ),
                    controller: _phoneTextEditingController,
                    validator: (value) {}),
                box(),
                dateField(),
                box(),
                Container(
                    width: size.width / 1.2,
                    child: DropdownButtonFormField(
                      onSaved: (value) {
                        gender = value.toString();
                      },
                      onChanged: (String? value) {
                        gender = value.toString();
                      },
                      decoration: InputDecoration(
                        labelText: "GENDER",
                        hintText: "Select gender",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      items: <String>['Male', 'Female', 'Other']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                box(),
                MyButton(
                    text: 'SAVE CHANGES',
                    onPressed: () async {
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      pass = preferences.getString('pass');
                      APIService().saveprofile(context,
                          email: email,
                          pass: pass,
                          firstName: _firstnameTextEditingController.text,
                          lastname: _lastnameTextEditingController.text,
                          mobileno: _phoneTextEditingController.text,
                          img: "",
                          dob: dateofbirth,
                          gender: gender);
                    }),
                box(),
                TextButton(
                  onPressed: () {
                    navigatorPush(context, false, ChangePass());
                  },
                  child: Text('CHANGE PASSWORD'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget box() {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 35,
    );
  }

  Widget dateField() {
    return InkWell(
      onTap: () {
        _selectDate(context);
      },
      child: Container(
        width: _width,
        alignment: Alignment.center,
        child: TextFormField(
          textAlign: TextAlign.start,
          enabled: false,
          keyboardType: TextInputType.text,
          controller: _dateController,
          onSaved: (val) {
            setDate = val;
          },
          decoration: InputDecoration(
              suffixIcon: Icon(Icons.calendar_today_sharp),
              labelText: 'DATE OF BIRTH',
              hintText: 'Select Date of birth',
              contentPadding: EdgeInsets.only(top: 0.0)),
        ),
      ),
    );
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat("yyyy-MM-dd").format(selectedDate);
        dateofbirth = _dateController.text;
        print(dateofbirth);
      });
  }

  Future<LoginResponseModel> getuser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String res = pref.getString('Login').toString();
    var jsonMap = json.decode(res);
    return LoginResponseModel.fromJson(jsonMap);
  }

  capturephotowithcamera() async {
    Navigator.pop(context);
    PickedFile? imagefile =
        await ImagePicker.platform.pickImage(source: ImageSource.camera);
    setState(() {
      file = File(imagefile!.path);
    });
  }

  selectfromgallery() async {
    Navigator.pop(context);
    PickedFile? imagefile =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(imagefile!.path);
    });
  }
}
