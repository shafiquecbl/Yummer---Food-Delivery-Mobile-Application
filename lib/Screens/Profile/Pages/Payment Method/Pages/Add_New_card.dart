import 'package:flutter/material.dart';
import 'package:secure_hops/Widgets/AppBar.dart';
import 'package:secure_hops/Widgets/Payment_card.dart';
import 'package:secure_hops/Widgets/button.dart';
import 'package:secure_hops/constants.dart';

class AddNewCard extends StatefulWidget {
  @override
  _AddNewCardState createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  String name = 'Kristin Watson';
  String cardNo = '1234 5678 1234 5678';
  String date = '12/23';
  String cvv = '123';
  InputBorder? focusedBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: appBar(context, title: 'Add New Card'),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                PaymentCard(index: 99),
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
                    initialValue: cardNo,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.camera_alt_outlined),
                      focusedBorder: focusedBorder,
                      hintText: "Enter card number",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: "CARD NUMBER",
                    ),
                    validator: (value) {}),
                box(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      child: TextFormField(
                          initialValue: date,
                          decoration: InputDecoration(
                            focusedBorder: focusedBorder,
                            hintText: "Enter date",
                            hintStyle: TextStyle(color: Colors.grey),
                            labelText: "MM/YY",
                          ),
                          validator: (value) {}),
                    ),
                    // box(),
                    Container(
                      width: 150,
                      child: TextFormField(
                          obscureText: true,
                          initialValue: cvv,
                          decoration: InputDecoration(
                            focusedBorder: focusedBorder,
                            hintText: "Enter CVV",
                            hintStyle: TextStyle(color: Colors.grey),
                            labelText: "CVV",
                          ),
                          validator: (value) {}),
                    ),
                  ],
                ),
                box(),
                box(),
                MyButton(text: 'SAVE CARD', onPressed: () {})
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
