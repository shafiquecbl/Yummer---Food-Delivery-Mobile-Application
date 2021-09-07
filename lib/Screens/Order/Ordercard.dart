import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../constants.dart';
import 'OrderHistoryCard.dart';

class Ordercard extends StatefulWidget {
  const Ordercard({Key? key}) : super(key: key);

  @override
  _OrdercardState createState() => _OrdercardState();
}

class _OrdercardState extends State<Ordercard> {
  bool _expanded = false;

  late final bool hasIcon;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(children: [
      Container(
        margin: EdgeInsets.all(10),
        color: Colors.green,
        child: ExpansionPanelList(
          animationDuration: Duration(milliseconds: 200),
          children: [
            ExpansionPanel(
              // <------

              headerBuilder: (context, isExpanded) {
                return OrderHistoryCard();
              },
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                    color: kBackgroundColor,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Tom Yum Goong x 1"),
                            Padding(
                              padding: const EdgeInsets.only(left: 100.0),
                              child: Text("\$ 10"),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Tom Yum Goong x 1"),
                            Padding(
                              padding: const EdgeInsets.only(left: 100.0),
                              child: Text("\$ 10"),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Tom Yum Goong x 1"),
                            Padding(
                              padding: const EdgeInsets.only(left: 100.0),
                              child: Text("\$ 10"),
                            ),
                          ],
                        ),
                        // ignore: deprecated_member_use
                        FlatButton(
                            onPressed: () {},
                            child: Text("Repeat Order"),
                            color: Colors.white,
                            minWidth: width)
                      ],
                    )),
              ),
              isExpanded: _expanded,

              canTapOnHeader: true,
            ),
          ],
          dividerColor: Colors.grey,
          expansionCallback: (panelIndex, isExpanded) {
            _expanded = !_expanded;
            setState(() {});
          },
        ),
      ),
    ]);
  }
}
