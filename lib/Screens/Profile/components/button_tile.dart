import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TileButton extends StatelessWidget {
  final Widget? icon;
  final String? text;
  final Function()? onPressed;
  TileButton(
      {@required this.icon, @required this.text, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        leading: icon,
        title: Text(text.toString()),
        trailing: FaIcon(Icons.arrow_forward_ios),
      ),
    );
  }
}
