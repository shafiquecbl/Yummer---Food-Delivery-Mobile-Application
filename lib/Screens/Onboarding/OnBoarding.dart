import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secure_hops/Screens/Authenticate/AuthenticScreen.dart';
import 'package:secure_hops/Widgets/button.dart';
import '../../constants.dart';
import 'Content_OnBoarding.dart';

class Onbording extends StatefulWidget {
  @override
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 40, right: 40),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 10.0, left: 220),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => AuthenticScreen(),
                                ),
                              );
                            },
                            child: Text(
                              currentIndex == contents.length - 1
                                  ? ""
                                  : "Skip>",
                              style: TextStyle(color: btncolor),
                            ),
                          ),
                        ),
                        Image.asset(
                          contents[i].image,
                          height: size.height / 3.3,
                          width: 250,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          contents[i].title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          contents[i].discription,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  contents.length,
                  (index) => buildDot(index, context),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0, top: 30),
              child: MyButton(
                  text:
                      currentIndex == contents.length - 1 ? "Continue" : "Next",
                  onPressed: () {
                    if (currentIndex == contents.length - 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AuthenticScreen(),
                        ),
                      );
                    }
                    _controller.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.bounceIn,
                    );
                  }),
            ),
            // GestureDetector(
            //   onTap: () {
            //     if (currentIndex == contents.length - 1) {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (_) => AuthenticScreen(),
            //         ),
            //       );
            //     }
            //     _controller.nextPage(
            //       duration: Duration(milliseconds: 100),
            //       curve: Curves.bounceIn,
            //     );
            //   },
            //   child: Stack(
            //     children: [
            //       Container(
            //         height: 60,
            //         margin: EdgeInsets.all(40),
            //         width: double.infinity,
            //         child: Image.asset(btn),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.only(top: 60.0, left: 160),
            //         child: Text(
            //           currentIndex == contents.length - 1 ? "Continue" : "Next",
            //           style: TextStyle(fontSize: 14, color: btntextColor),
            //         ),
            //       )
            //     ],
            //   ),
            // )
            // Stack(
            //   children:[ Container(
            //     height: 60,
            //     margin: EdgeInsets.all(40),
            //     width: double.infinity,
            //     child: FlatButton(
            //       child: Text(
            //           currentIndex == contents.length - 1 ? "Continue" : "Next"),
            //       onPressed: () {
            //         if (currentIndex == contents.length - 1) {
            //           Navigator.pushReplacement(
            //             context,
            //             MaterialPageRoute(
            //               builder: (_) => AuthenticScreen(),
            //             ),
            //           );
            //         }
            //         _controller.nextPage(
            //           duration: Duration(milliseconds: 100),
            //           curve: Curves.bounceIn,
            //         );
            //       },
            //       color: Colors.redAccent,
            //       textColor: Colors.white,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(20),
            //       ),
            //     ),
            //   ),
            // ])
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: btncolor,
      ),
    );
  }
}
