import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:secure_hops/Screens/Profile/Pages/Edit%20Profile/Profile_Edit_Page.dart';
import 'package:secure_hops/Widgets/navigator.dart';
import 'package:secure_hops/constants.dart';

class ProfileCard extends StatelessWidget {
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
            Expanded(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    demoAvatar,
                  ),
                  radius: 30,
                ),
                title: Text(
                  'Kristin Watson',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  'kristinwatson@gmail.com',
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  navigatorPush(context, true, ProfileEditPage());
                },
                icon: FaIcon(
                  // Icons.edit
                  FontAwesomeIcons.edit,
                  color: Colors.grey,
                ))
          ],
        ),
      ),
    );
  }
}
