import 'package:flutter/material.dart';
import 'package:secure_hops/Widgets/AppBar.dart';
import 'package:secure_hops/Widgets/button.dart';
import 'package:secure_hops/constants.dart';

class ProfileEditPage extends StatefulWidget {
  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  String name = 'Kristin Watson';
  String email = 'kristinwatson@gmail.com';
  String phoneNo = '+32 0123456789';
  String location = 'Chicago, USA';
  InputBorder? focusedBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor),
  );

  @override
  Widget build(BuildContext context) {
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
                            onTap: () {},
                          )),
                    ],
                  ),
                ),
                box(),
                TextFormField(
                    initialValue: name,
                    decoration: InputDecoration(
                      focusedBorder: focusedBorder,
                      hintText: "Enter name",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: "NAME",
                    ),
                    validator: (value) {}),
                box(),
                TextFormField(
                    initialValue: email,
                    decoration: InputDecoration(
                      focusedBorder: focusedBorder,
                      hintText: "Enter email",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: "EMAIL",
                    ),
                    validator: (value) {}),
                box(),
                TextFormField(
                    initialValue: phoneNo,
                    decoration: InputDecoration(
                      focusedBorder: focusedBorder,
                      hintText: "Enter phone #",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: "PHONE NUMBER",
                    ),
                    validator: (value) {}),
                box(),
                TextFormField(
                    initialValue: location,
                    decoration: InputDecoration(
                      focusedBorder: focusedBorder,
                      hintText: "Enter location",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: "LOCATION",
                    ),
                    validator: (value) {}),
                box(),
                box(),
                MyButton(text: 'SAVE CHANGES', onPressed: () {})
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
}
