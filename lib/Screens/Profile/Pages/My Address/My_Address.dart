import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:secure_hops/API/Api_Services/Api_Manager.dart';
import 'package:secure_hops/Provider/user_provider.dart';
import 'package:secure_hops/Screens/Profile/Pages/My%20Address/Pages/Add_new_address.dart';
import 'package:secure_hops/Screens/Profile/components/divider.dart';
import 'package:secure_hops/Widgets/AppBar.dart';
import 'package:secure_hops/Widgets/button.dart';
import 'package:secure_hops/Widgets/navigator.dart';
import 'package:secure_hops/model/addressResponseModel.dart';

class MyAddress extends StatefulWidget {
  @override
  State<MyAddress> createState() => _MyAddressState();
}

class _MyAddressState extends State<MyAddress> {
  AdressResponseModel? res;
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginStorage>(builder: (context, login, child) {
      return Scaffold(
        appBar: appBar(context, title: 'My Address'),
        body: FutureBuilder<List<AdressResponseModel>>(
          future: APIService().showadrs(context,
              username: login.loginResponseModel!.userName,
              userpass: login.password),
          builder: (BuildContext context,
              AsyncSnapshot<List<AdressResponseModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(
                child: CircularProgressIndicator(),
              );
            if (snapshot.data!.length == 0)
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'No address.\nPlease add new address',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  addAddressButton()
                ],
              );
            return showAddress(context, snapshot.data!);
          },
        ),
      );
    });
  }

  showAddress(BuildContext context, List<AdressResponseModel> responseModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: responseModel.length,
                itemBuilder: (context, index) {
                  res = responseModel[index]; //assign Value
                  return Dismissible(
                    background: slideRightBackground(),
                    secondaryBackground: slideLeftBackground(),
                    confirmDismiss: (direction) async {
                      if (direction == DismissDirection.endToStart) {
                        return await delete();
                      } else {
                        print("edit wala implement nh hua abi");
                      }
                    },
                    key: Key(index.toString()),
                    child: InkWell(
                      onTap: () {},
                      child: ListTile(
                        leading: FaIcon(index == 0
                            ? Icons.home_outlined
                            : index == 1
                                ? Icons.work_outline_outlined
                                : Icons.location_pin),
                        title: Text(res!.fullName.toString()),
                        subtitle: Text(res!.addressText.toString()),
                      ),
                    ),
                  );
                }),
          ),
          CustomDivider(),
          addAddressButton(),
        ],
      ),
    );
  }

  addAddressButton() {
    return MyButton(
        text: 'ADD NEW ADDRESS',
        onPressed: () {
          navigatorPush(context, false, AddNewAddress());
        });
  }

  Widget slideRightBackground() {
    return Container(
      color: Colors.green,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.edit,
              color: Colors.white,
            ),
            Text(
              " Edit",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }

  delete() {
    APIService().delete_adrs(
        addresscode: res!.addressCode,
        username: LoginStorage().loginResponseModel!.userName,
        userpass: LoginStorage().password);
  }
}
