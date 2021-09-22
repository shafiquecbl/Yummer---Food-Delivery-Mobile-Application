import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secure_hops/Widgets/button.dart';
import 'package:secure_hops/Widgets/navigator.dart';
import '../../constants.dart';
import 'Login.dart';

class DoneReset extends StatefulWidget {
  const DoneReset({Key? key}) : super(key: key);

  @override
  _DoneResetState createState() => _DoneResetState();
}

class _DoneResetState extends State<DoneReset> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Image.asset("assets/resetimage.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      child: Text(
                    "Your password  has been reset!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    height: size.height / 20.5,
                  ),
                  MyButton(
                      text: "Done",
                      onPressed: () {
                        navigatorPush(context, true, AuthenticScreen());
                      })
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
