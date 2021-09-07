import 'package:flutter/material.dart';
import 'package:secure_hops/constants.dart';

class MyButton extends StatelessWidget {
  final String? text;
  final Function()? onPressed;
  const MyButton({@required this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size.width / 1.2,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
                image: AssetImage('assets/btn.png'), fit: BoxFit.cover)),
        child: Center(
          child: Text(
            text.toString(),
            style: TextStyle(
                color: btntextColor, fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
