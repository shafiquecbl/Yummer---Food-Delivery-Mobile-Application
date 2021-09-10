import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secure_hops/Screens/Home/components/ItemList.dart';
import 'package:secure_hops/Screens/Search/Filter.dart';
import 'package:secure_hops/Screens/Search/Tabs/ApplyFilter/CafeInfo.dart';
import 'package:secure_hops/Widgets/button.dart';
import 'package:secure_hops/Widgets/navigator.dart';

import '../../../../constants.dart';
import 'FilterItemList.dart';
import 'Tabs.dart';

class AppplyFilter extends StatefulWidget {
  const AppplyFilter({Key? key}) : super(key: key);

  @override
  _AppplyFilterState createState() => _AppplyFilterState();
}

class _AppplyFilterState extends State<AppplyFilter> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: Container(
            color: kWhiteColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: MyButton(text: 'VIEW CART', onPressed: () {}),
            )),
        backgroundColor: kBackgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: size.width,
                  height: size.height * .27,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img.png'), fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height / 7,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: size.height / 12,
                    ),
                    Container(
                      height: size.height / 4.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 20.0, left: 20),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/croissant 1.png'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Container(
                            height: size.height / 3,
                            width: size.width / 1.3,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15, top: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Croissant Cafe',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: kWhiteColor,
                                          fontWeight: FontWeight.w500)),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: size.width / 1.7,
                                        child: Text(
                                          'Bakery',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: kWhiteColor, fontSize: 16),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            settingModalBottomSheet(context);
                                          },
                                          icon: Icon(
                                            Icons.info_outline,
                                            color: kWhiteColor,
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height / 60,
                                  ),
                                  Container(
                                    height: 40,
                                    width: size.width / 1.5,
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Icon(
                                            Icons.delivery_dining_outlined,
                                            color: primaryColor,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text("Free Deliver From "),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10.0),
                                          child: Text(
                                            "\$ 200",
                                            style: TextStyle(
                                                color: primaryColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: FilterTabs(),
            ),
            Expanded(child: FilterItemList()),
          ],
        ));
  }
}
