import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secure_hops/API/Api_Services/Api_Manager.dart';
import 'package:secure_hops/Provider/user_provider.dart';
import 'package:secure_hops/Screens/Profile/components/changepass.dart';
import 'package:secure_hops/Widgets/AppBar.dart';
import 'package:secure_hops/Widgets/button.dart';
import 'package:secure_hops/Widgets/error_widget.dart';
import 'package:secure_hops/Widgets/navigator.dart';
import 'package:secure_hops/constants.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:secure_hops/size_config.dart';

class ProfileEditPage extends StatefulWidget {
  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  LoginStorage? loginStorage;
  bool? isLoading = false;

  File? file;
  String? setDate;

  String? dateofbirth;

  DateTime selectedDate = DateTime.now();

  TextEditingController _dateController = TextEditingController();

  String? gender, firstName, lastName, phoneNo, error;

  InputBorder? focusedBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor),
  );
  @override
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
      SizeConfig().init(context);
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
                  imageBox(),
                  box(),
                  Text(
                    login.loginResponseModel!.email.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  firstNameFormField(),
                  box(),
                  lastNameFormField(),
                  box(),
                  phoneNoFormField(),
                  box(),
                  dateField(),
                  box(),
                  genderFormField(),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 7),
                    child: Row(
                      children: [
                        error != null
                            ? MyError(
                                error: error,
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  isLoading!
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(),
                  box(),
                  MyButton(
                      text: 'SAVE CHANGES',
                      onPressed: () async {
                        loginStorage!.profile != null
                            ? checkUpdate()
                            : checkSave();
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
    });
  }

  checkSave() {
    if (firstName == null) {
      setState(() {
        error = 'Please provide first name';
      });
    } else if (lastName == null) {
      setState(() {
        error = 'Please provide last name';
      });
    } else if (phoneNo == null) {
      setState(() {
        error = 'Please provide phone No';
      });
    } else if (gender == null) {
      setState(() {
        error = 'Please select gender';
      });
    } else if (dateofbirth == null) {
      setState(() {
        error = 'Please select DOB';
      });
    } else {
      saveProfile(
          email: loginStorage!.loginResponseModel!.email,
          password: loginStorage!.password);
    }
  }

  checkUpdate() {
    if (firstName == null) {
      firstName = loginStorage!.profile!.firstName;
    }
    if (lastName == null) {
      lastName = loginStorage!.profile!.lastname;
    }
    if (phoneNo == null) {
      phoneNo = loginStorage!.profile!.mobileno;
    }
    if (gender == null) {
      gender = loginStorage!.profile!.gender;
    }
    if (dateofbirth == null) {
      dateofbirth = loginStorage!.profile!.dob;
    }
    saveProfile(
        email: loginStorage!.loginResponseModel!.email,
        password: loginStorage!.password);
  }

  imageBox() {
    return Center(
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
                    border: Border.all(width: 4, color: Colors.white),
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
                  showImageDialog();
                },
              )),
        ],
      ),
    );
  }

  firstNameFormField() {
    return TextFormField(
        initialValue: loginStorage!.profile != null
            ? loginStorage!.profile!.firstName
            : null,
        onChanged: (value) {
          firstName = value;
        },
        onSaved: (value) {
          firstName = value;
        },
        decoration: InputDecoration(
          focusedBorder: focusedBorder,
          hintText: "Enter First Name",
          hintStyle: TextStyle(color: Colors.grey),
          labelText: "FIRST NAME",
        ),
        validator: (value) {});
  }

  lastNameFormField() {
    return TextFormField(
        initialValue: loginStorage!.profile != null
            ? loginStorage!.profile!.lastname
            : null,
        onChanged: (value) {
          lastName = value;
        },
        onSaved: (value) {
          lastName = value;
        },
        decoration: InputDecoration(
          focusedBorder: focusedBorder,
          hintText: "Enter Last Name",
          hintStyle: TextStyle(color: Colors.grey),
          labelText: "LAST NAME",
        ),
        validator: (value) {});
  }

  phoneNoFormField() {
    return TextFormField(
        initialValue: loginStorage!.profile != null
            ? loginStorage!.profile!.mobileno
            : null,
        onChanged: (value) {
          phoneNo = value;
        },
        onSaved: (value) {
          phoneNo = value;
        },
        decoration: InputDecoration(
          focusedBorder: focusedBorder,
          hintText: "Enter phone #",
          hintStyle: TextStyle(color: Colors.grey),
          labelText: "PHONE NUMBER",
        ),
        validator: (value) {});
  }

  Widget genderFormField() {
    return Container(
        width: SizeConfig.screenWidth! / 1.2,
        child: DropdownButtonFormField(
          onSaved: (value) {
            gender = value.toString();
          },
          onChanged: (String? value) {
            gender = value.toString();
          },
          decoration: InputDecoration(
            labelText: "GENDER",
            hintText: loginStorage!.profile != null
                ? loginStorage!.profile!.gender
                : "Select gender",
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          items: <String>['Male', 'Female', 'Other']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ));
  }

  showImageDialog() {
    return showDialog(
        context: context,
        builder: (con) {
          return AlertDialog(
              actions: [
                SimpleDialogOption(
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
              title: Text(
                "Select image from",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: Wrap(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(primary: Colors.black),
                    child: Text(
                      "CAMERA",
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      capturephotowithcamera();
                    },
                  ),
                  Divider(
                    height: 2,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(primary: Colors.black),
                    child: Text(
                      "GALLERY",
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      selectfromgallery();
                    },
                  ),
                ],
              ));
        });
  }

  saveProfile({@required String? email, @required String? password}) {
    setState(() {
      error = null;
      isLoading = true;
    });
    return APIService()
        .saveprofile(context,
            email: email,
            pass: password,
            firstName: firstName,
            lastname: lastName,
            mobileno: phoneNo,
            img: "",
            dob: dateofbirth,
            gender: gender)
        .then((value) {
      setState(() {
        isLoading = false;
      });
    });
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
              labelText: loginStorage!.profile != null
                  ? loginStorage!.profile!.dob
                  : 'DATE OF BIRTH',
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
        firstDate: DateTime(1900),
        lastDate: DateTime(2022));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat("yyyy-MM-dd").format(selectedDate);
        dateofbirth = _dateController.text;
        print(dateofbirth);
      });
  }

  capturephotowithcamera() async {
    Navigator.pop(context);
    PickedFile? imagefile =
        // ignore: invalid_use_of_visible_for_testing_member
        await ImagePicker.platform.pickImage(source: ImageSource.camera);
    setState(() {
      file = File(imagefile!.path);
    });
  }

  selectfromgallery() async {
    Navigator.pop(context);
    PickedFile? imagefile =
        // ignore: invalid_use_of_visible_for_testing_member
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(imagefile!.path);
    });
  }
}
