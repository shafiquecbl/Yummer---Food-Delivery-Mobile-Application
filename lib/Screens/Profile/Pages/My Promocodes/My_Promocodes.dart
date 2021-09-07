import 'package:flutter/material.dart';
import 'package:secure_hops/Screens/Profile/Pages/My%20Favorite/Tabs/Food.dart';
import 'package:secure_hops/Screens/Profile/Pages/My%20Favorite/Tabs/Resturants.dart';
import 'package:secure_hops/Screens/Profile/Pages/My%20Promocodes/Tabs/Current.dart';
import 'package:secure_hops/Screens/Profile/Pages/My%20Promocodes/Tabs/Used.dart';
import 'package:secure_hops/Widgets/AppBar.dart';
import 'package:secure_hops/Widgets/Material%20Color.dart';
import 'package:secure_hops/constants.dart';

class MyPromocodes extends StatefulWidget {
  @override
  _MyPromocodesState createState() => _MyPromocodesState();
}

class _MyPromocodesState extends State<MyPromocodes>
    with SingleTickerProviderStateMixin {
  late TabController _tabController = TabController(length: 2, vsync: this);

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: appBar(context, title: 'My Promocodes'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // give the tab bar a height [can change hheight to preferred height]
            tabButton(),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // first tab bar view widget
                  Current(),
                  // second tab bar view widget
                  Used(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabButton() {
    return Container(
      height: 35,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: TabBar(
          overlayColor: color(Colors.transparent),
          controller: _tabController,
          // give the indicator a decoration (color and border radius)
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              // color: Colors.green,
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.redAccent, Colors.pinkAccent])),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          tabs: [
            // first tab [you can add an icon using the icon property]
            Tab(
              text: 'Common',
            ),

            // second tab [you can add an icon using the icon property]
            Tab(
              text: 'Used',
            ),
          ],
        ),
      ),
    );
  }
}
