import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secure_hops/Images.dart';
import 'package:secure_hops/constants.dart';

class PaymentCard extends StatelessWidget {
  final int? index;
  const PaymentCard({@required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 199,
      width: 344,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: index == 99
            ? kCard4Color
            : index == 0
                ? kCard1Color
                : index == 1
                    ? kCard2Color
                    : kCard3Color,
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 29,
            top: 65,
            child: Text(
              '1234 5678 1234 5678',
              style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: kWhiteColor),
            ),
          ),
          ///////// IMAGES START /////////
          Positioned(
            right: 65,
            top: 15,
            child: Image.asset(ellipse11, width: 50, height: 50),
          ),
          Positioned(
            right: 15,
            bottom: 50,
            child: Image.asset(ellipse10, width: 10, height: 10),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset(
              ellipse8,
              width: 90,
              height: 100,
            ),
          ),
          Positioned(
            right: 115,
            bottom: 55,
            child: Image.asset(
              ellipse9,
              width: 25,
              height: 25,
            ),
          ),
          Positioned(
            left: 20,
            top: 10,
            child: Image.asset(
              image7,
              width: 60,
              height: 60,
            ),
          ),
          ///////// IMAGES END /////////
          Positioned(
            left: 29,
            bottom: 22,
            child: Text(
              'KRISTIN\nWATSON',
              style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: kWhiteColor),
            ),
          ),
          Positioned(
            left: 226,
            bottom: 45,
            child: Text(
              'EXP.END',
              style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: kWhiteColor),
            ),
          ),
          Positioned(
            left: 226,
            bottom: 21,
            child: Text(
              '12/21',
              style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: kWhiteColor),
            ),
          )
        ],
      ),
    );
  }
}
