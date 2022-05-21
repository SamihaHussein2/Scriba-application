import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'config.dart';

class AppTheme {
  static const darkRed = Color.fromRGBO(35, 31, 32, 1);
  static const darkRedOpacity = Color.fromRGBO(35, 31, 32, 0.9);
  static const moderateOrange = Color.fromRGBO(197, 154, 67, 1);
  static const gradientColor = Color.fromRGBO(237, 223, 147, 1);
  static TextStyle macondoFont = GoogleFonts.macondoSwashCaps();

  static ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    textStyle: TextStyle(
        fontSize: getProportionateScreenWidth(15),
        fontFamily: macondoFont.fontFamily,
        color: moderateOrange),
    primary: darkRedOpacity,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    side: const BorderSide(color: moderateOrange, width: 3),
    padding: const EdgeInsets.only(left: 90, right: 90, top: 10, bottom: 10),
  );

  static ButtonStyle buttonGolden = ElevatedButton.styleFrom(
    textStyle: TextStyle(
        fontSize: getProportionateScreenWidth(15),
        fontFamily: macondoFont.fontFamily,
        color: darkRedOpacity),
    primary: moderateOrange,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    side: const BorderSide(color: moderateOrange, width: 3),
    padding: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
  );

  static ButtonStyle loginStyle = ElevatedButton.styleFrom(
    textStyle: TextStyle(
        fontSize: getProportionateScreenWidth(15),
        fontFamily: macondoFont.fontFamily,
        color: moderateOrange),
    primary: darkRedOpacity,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    side: const BorderSide(color: moderateOrange, width: 3),
    padding: const EdgeInsets.only(left: 90, right: 90, top: 10, bottom: 10),
  );
}
