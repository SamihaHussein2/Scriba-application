import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scriba_app/defaults/theme.dart';

class AppTextField extends StatelessWidget {
  final Color fillColor;
  final Color textColor;
  final String text;
  final String? fontfamily = GoogleFonts.macondoSwashCaps().fontFamily;
  //TextEditingController controller;
  final bool obscureText;
  AppTextField({
    Key? key,
    required this.fillColor,
    required this.textColor,
    required this.text,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      style: TextStyle(color: AppTheme.moderateOrange),
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(
          color: textColor,
          fontFamily: fontfamily,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: fillColor, width: 3.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: fillColor, width: 3.0),
        ),
      ),
    );
  }
}
