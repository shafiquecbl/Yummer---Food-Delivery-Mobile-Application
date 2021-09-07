import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Images.dart';
import '../../constants.dart';
import 'AuthenticScreen.dart';

class DoneReset extends StatefulWidget {
  const DoneReset({Key? key}) : super(key: key);

  @override
  _DoneResetState createState() => _DoneResetState();
}

class _DoneResetState extends State<DoneReset> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 0.0),
              child: Container(
                child: Image.asset("assets/resetimage.png"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 200.0),
            child: Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0, bottom: 20),
                        child: Container(
                            width: 200,
                            child: Text(
                              "Your password  has been reset!",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: GestureDetector(
                            onTap: () {
                              Route route = MaterialPageRoute(
                                  builder: (_) => AuthenticScreen());
                              Navigator.push(context, route);
                            },
                            child: Stack(
                              children: [
                                Container(
                                  child: Image.asset(btn),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 130),
                                  child: Text(
                                    "DONE",
                                    style: TextStyle(
                                        color: btntextColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                          )
                          // Image.asset(btn,height: 250,width: 250,),
                          // child: ElevatedButton(
                          //   child: Text("DONE",style: TextStyle(color: Colors.white,fontSize: 15),),
                          //   onPressed: (){
                          //     Route route=MaterialPageRoute(builder: (_)=>AuthenticScreen());
                          //     Navigator.pushReplacement(context, route);
                          //   },
                          //   style: ElevatedButton.styleFrom(
                          //       primary: Colors.redAccent,
                          //       padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                          //       textStyle: TextStyle(
                          //           fontSize: 30,
                          //           fontWeight: FontWeight.bold)),
                          //
                          //
                          // ),
                          ),
                    ],
                  ),
                )),
          )
        ],
      ),
    ));
  }
}
