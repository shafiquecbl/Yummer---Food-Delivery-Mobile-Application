import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:secure_hops/API/Api_Services/Api_Manager.dart';
import 'package:secure_hops/Screens/Profile/Pages/My%20Address/Pages/Add_new_address.dart';
import 'package:secure_hops/Screens/Profile/components/divider.dart';
import 'package:secure_hops/Widgets/AppBar.dart';
import 'package:secure_hops/Widgets/button.dart';
import 'package:secure_hops/Widgets/navigator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:secure_hops/model/addressResponseModel.dart';

class MyAddress extends StatelessWidget {
  get_adress() async {
    Response responses = await http.post(
        Uri.parse(
            'https://www.ohready1.com/api/CustomersApi/getCustomerAddresses'),
        body: {
          'userName': "abcd",
          'userPass': "123",
        });

    var result = json.decode(responses.body);
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: 'My Address'),
      body: FutureBuilder<List<AdressResponseModel>>(
        future: APIService().showadrs(context),
        builder: (BuildContext context,
            AsyncSnapshot<List<AdressResponseModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          return showAddress(context, snapshot.data);
        },
      ),
    );
  }

  showAddress(BuildContext context, List<AdressResponseModel>? snapshot) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: ListView(
        children: [
          InkWell(
            onTap: () {
              get_adress();
            },
            child: ListTile(
              leading: FaIcon(Icons.home_outlined),
              title: Text('Home'),
              subtitle: Text('8000 S Kirkland Ave, Chicago, IL 6065...'),
            ),
          ),
          CustomDivider(),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: FaIcon(Icons.work_outline),
              title: Text('Work'),
              subtitle: Text('8000 S Kirkland Ave, Chicago, IL 6065...'),
            ),
          ),
          CustomDivider(),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: FaIcon(Icons.location_pin),
              title: Text('Other'),
              subtitle: Text('8000 S Kirkland Ave, Chicago, IL 6065...'),
            ),
          ),
          CustomDivider(),
          SizedBox(
            height: 30,
          ),
          MyButton(
              text: 'ADD NEW ADDRESS',
              onPressed: () {
                navigatorPush(context, false, AddNewAddress());
              })
        ],
      ),
    );
  }
}
