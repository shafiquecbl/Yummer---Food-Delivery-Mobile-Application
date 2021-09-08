import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secure_hops/Screens/Search/Filter.dart';
import 'package:secure_hops/Screens/Search/Tabs/ApplyFilter/CafeInfo.dart';
import 'package:secure_hops/Widgets/navigator.dart';

import '../../../../constants.dart';

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
        backgroundColor: kBackgroundColor,
        body: Stack(
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
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 100, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/croissant 1.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    height: size.height / 4,
                    width: size.width / 1.3,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 35),
                            child: Container(
                              height: 30,
                              width: size.width / 1.7,
                              decoration: BoxDecoration(color: Colors.white),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.delivery_dining_outlined,
                                    color: Colors.white,
                                  ),
                                  Text("Free Deliver From "),
                                  Text("\$"),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
