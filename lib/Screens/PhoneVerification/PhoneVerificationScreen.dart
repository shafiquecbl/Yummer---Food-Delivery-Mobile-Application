import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:secure_hops/Widgets/AppBar.dart';

import '../../Images.dart';
import '../../constants.dart';
import 'OTP/OtpScreen.dart';

class PhoneverificationScreen extends StatefulWidget {
  @override
  _PhoneverificationScreenState createState() =>
      _PhoneverificationScreenState();
}

class _PhoneverificationScreenState extends State<PhoneverificationScreen> {
  GlobalKey<FormState> _formKey = GlobalKey();
  String Phone = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: appBar(context, title: "Verify Your Phone Number"),
        // AppBar(
        //   kBackgroundColor: kBackgroundColor,
        //   title: Text('Verify your phone number',style: TextStyle(color: HeadingColor,fontSize: 18),),
        //   leading: IconButton(
        //     icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        //     onPressed: () {
        //       Route route=MaterialPageRoute(builder: (_)=>AuthenticScreen());
        //       Navigator.push(context, route);
        //     },
        //   ),
        // ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "We have sent you an sms with a code to number " +
                            Phone,
                        style: TextStyle(color: textColor),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),

                    IntlPhoneField(
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                        labelText: 'Phone Number',
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      onChanged: (phone) {
                        setState(() {
                          Phone = phone.completeNumber;
                        });
                        print(phone.completeNumber);
                      },
                      onCountryChanged: (phone) {
                        print('Country code changed to: ' +
                            phone.countryCode.toString());
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Route route =
                              MaterialPageRoute(builder: (_) => OtpScreen());
                          Navigator.push(context, route);
                        }
                      },
                      child: Stack(
                        children: [
                          Container(
                            child: Image.asset(btn),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, left: 120),
                            child: Text(
                              "CONFIRM",
                              style: TextStyle(
                                  color: btntextColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    )

                    // MaterialButton(
                    //   child: Text('Submit'),
                    //   color: Theme.of(context).primaryColor,
                    //   textColor: Colors.white,
                    //   onPressed: () {
                    //     _formKey.currentState!.validate();
                    //   },
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
