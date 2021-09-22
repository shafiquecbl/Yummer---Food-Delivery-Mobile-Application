import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secure_hops/constants.dart';

class ProgressHUD extends StatelessWidget {
  final double opacity;
  final Color color;

  ProgressHUD({
    this.opacity = 0.3,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = <Widget>[];

    final modal = new Stack(
      children: [
        new Opacity(
          opacity: opacity,
          child: ModalBarrier(dismissible: false, color: primaryColor),
        ),
        new Center(child: new CircularProgressIndicator()),
      ],
    );
    widgetList.add(modal);

    return Stack(
      children: widgetList,
    );
  }
}
