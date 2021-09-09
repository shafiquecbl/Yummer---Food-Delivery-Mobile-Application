import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:secure_hops/Screens/Profile/Pages/My%20Address/Pages/Add_new_address.dart';
import 'package:secure_hops/Screens/Profile/components/divider.dart';
import 'package:secure_hops/Widgets/AppBar.dart';
import 'package:secure_hops/Widgets/button.dart';
import 'package:secure_hops/Widgets/navigator.dart';
import 'package:secure_hops/constants.dart';

import '../../../Images.dart';
import '../DoneOrder.dart';
import 'CheckoutBottomSheet.dart';

class Checkout extends StatefulWidget {
  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
          color: kWhiteColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: MyButton(
                text: 'SEND ORDER',
                onPressed: () {
                  checkoutModalBottomSheet(context);
                }),
          )),
      appBar: appBar(context, title: 'Checkout'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ListView(
          children: [
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: FaIcon(Icons.backpack_outlined),
                title: Text('My Order'),
                subtitle: Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        size: 18,
                        color: textColor,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          'Croissant Cafe',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '\$60.95',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: kPrimaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CustomDivider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: FaIcon(
                  Icons.location_pin,
                  color: textColor,
                ),
                title: Text('Delivery Address'),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    '8000 S Kirkland Ave, Chicago, IL 6065...',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            CustomDivider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: FaIcon(
                  Icons.payment_outlined,
                  color: textColor,
                ),
                title: Text('Payment Method'),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    '1234 **** **** 5678',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            CustomDivider(),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'COMMENT',
                style: TextStyle(
                    fontSize: 14,
                    color: textColor,
                    fontWeight: FontWeight.w400),
              ),
            ),

            // Add the comment here
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '',
                style: TextStyle(
                    fontSize: 14,
                    color: textColor,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            CustomDivider(),
          ],
        ),
      ),
    );
  }

  void addressModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(builder: (context, setState2) {
            return Container(
              child: new Wrap(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Spacer(),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.close)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Choose Delivery Address",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Home",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(
                                      "8000 S Kirkland Ave, Chicago, IL 606..."),
                                  Spacer(),
                                  Radio(
                                    value: 0,
                                    groupValue: radioValue,
                                    onChanged: (int? value) {
                                      setState2(() {
                                        radioValue = value!;
                                        navigatorPush(
                                            context, true, DoneOrder());
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Work",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(
                                      "8000 S Kirkland Ave, Chicago, IL 606..."),
                                  Spacer(),
                                  Radio(
                                    value: 1,
                                    groupValue: radioValue,
                                    onChanged: (int? value) {
                                      setState2(() {
                                        radioValue = value!;
                                        navigatorPush(
                                            context, true, DoneOrder());
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Other",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(
                                      "8000 S Kirkland Ave, Chicago, IL 606..."),
                                  Spacer(),
                                  Radio(
                                    value: 2,
                                    groupValue: radioValue,
                                    onChanged: (int? value) {
                                      setState2(() {
                                        radioValue = value!;
                                        navigatorPush(
                                            context, true, DoneOrder());
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Current Location",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(
                                      "8000 S Kirkland Ave, Chicago, IL 606..."),
                                  Spacer(),
                                  Radio(
                                    value: 3,
                                    groupValue: radioValue,
                                    onChanged: (int? value) {
                                      setState2(() {
                                        radioValue = value!;
                                        navigatorPush(
                                            context, true, DoneOrder());
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }

  void checkoutModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(builder: (context, setState1) {
            return Container(
              child: new Wrap(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Spacer(),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.close)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Choose Payement Method",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Card(
                                elevation: 0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  child: Row(
                                    children: [
                                      Wrap(
                                        direction: Axis.vertical,
                                        children: [
                                          Image.asset(
                                            applyPay,
                                            width: 50,
                                            height: 50,
                                          ),
                                          Text(
                                            'Apple Pay',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      Radio(
                                        value: 0,
                                        groupValue: radioValue,
                                        onChanged: (int? value) {
                                          setState1(() {
                                            radioValue = value!;
                                            addressModalBottomSheet(context);
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Card(
                                elevation: 0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20),
                                  child: Row(
                                    children: [
                                      Wrap(
                                        direction: Axis.vertical,
                                        children: [
                                          Image.asset(
                                            paypal,
                                            width: 50,
                                            height: 50,
                                          ),
                                          Text(
                                            'Pay Pal',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      Radio(
                                        value: 1,
                                        groupValue: radioValue,
                                        onChanged: (int? value) {
                                          setState1(() {
                                            radioValue = value!;
                                            addressModalBottomSheet(context);
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Credit Cards",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Text("6566**********5465"),
                              Spacer(),
                              Radio(
                                value: 2,
                                groupValue: radioValue,
                                onChanged: (int? value) {
                                  setState1(() {
                                    radioValue = value!;
                                    addressModalBottomSheet(context);
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Text("6566**********5465"),
                              Spacer(),
                              Radio(
                                value: 3,
                                groupValue: radioValue,
                                onChanged: (int? value) {
                                  setState1(() {
                                    radioValue = value!;
                                    addressModalBottomSheet(context);
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }

  int radioValue = 0;

  void handleRadioValueChanged(int? value) {
    setState(() {
      radioValue = value!;
    });
  }
}
