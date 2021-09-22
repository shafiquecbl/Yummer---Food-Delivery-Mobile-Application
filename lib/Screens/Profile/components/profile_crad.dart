import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:secure_hops/Provider/user_provider.dart';
import 'package:secure_hops/Screens/Profile/Pages/Edit%20Profile/Profile_Edit_Page.dart';
import 'package:secure_hops/Widgets/navigator.dart';
import 'package:secure_hops/constants.dart';

class ProfileCard extends StatefulWidget {
  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  void initState() {
    LoginStorage provider = Provider.of(context, listen: false);
    provider.getuser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Consumer<LoginStorage>(builder: (context, login, child) {
              return profile(
                  name: login.profile == null
                      ? login.loginResponseModel!.userName
                      : '${login.profile!.firstName}' +
                          '${login.profile!.lastname}',
                  email: login.loginResponseModel!.email);
            }),
            IconButton(
                onPressed: () {
                  navigatorPush(context, true, ProfileEditPage());
                },
                icon: FaIcon(
                  FontAwesomeIcons.edit,
                  color: Colors.grey,
                ))
          ],
        ),
      ),
    );
  }

  profile({@required String? name, String? email}) {
    return Expanded(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(demoAvatar
              // user!.photoURL.toString(),
              ),
          radius: 30,
        ),
        title: Text(
          name.toString(),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          email.toString(),
        ),
      ),
    );
  }
}
