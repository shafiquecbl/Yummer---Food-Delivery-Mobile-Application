import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:secure_hops/API/Api_Services/Api_Manager.dart';
import 'package:secure_hops/Screens/Profile/Pages/My%20Address/Pages/Add_new_address.dart';
import 'package:secure_hops/Screens/Profile/components/divider.dart';
import 'package:secure_hops/Widgets/AppBar.dart';
import 'package:secure_hops/Widgets/button.dart';
import 'package:secure_hops/Widgets/navigator.dart';
import 'package:secure_hops/model/addressResponseModel.dart';

class MyAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: 'My Address'),
      body: FutureBuilder<List<AdressResponseModel>>(
        future:
            APIService().showadrs(context, username: "hamxa", userpass: "1234"),
        builder: (BuildContext context,
            AsyncSnapshot<List<AdressResponseModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          return showAddress(context, snapshot.data!);
        },
      ),
    );
  }

  showAddress(BuildContext context, List<AdressResponseModel> responseModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Wrap(
        direction: Axis.vertical,
        children: [
          Container(
            height: 500,
            child: ListView.builder(
                itemCount: responseModel.length,
                itemBuilder: (context, index) {
                  AdressResponseModel res = responseModel[index];
                  return InkWell(
                    onTap: () {},
                    child: ListTile(
                      leading: FaIcon(Icons.home_outlined),
                      title: Text(res.addressText.toString()),
                      subtitle:
                          Text('8000 S Kirkland Ave, Chicago, IL 6065...'),
                    ),
                  );
                }),
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
  // Future<LoginResponseModel> getuser() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   String res = pref.getString('Login').toString();
  //   var jsonMap = json.decode(res);
  //   return LoginResponseModel.fromJson(jsonMap);
}
