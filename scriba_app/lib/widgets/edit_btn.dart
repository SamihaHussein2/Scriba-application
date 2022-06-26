import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scriba_app/defaults/config.dart';
import 'package:scriba_app/defaults/theme.dart';
import 'package:scriba_app/widgets/font_size_intro.dart';

class EditBtn extends StatelessWidget {
  final double width;
  final double height;
  final BoxDecoration decoration;
  final Widget link;
  final String text;
  final Color textcolor;
  final double fontSize;
  const EditBtn(
      {Key? key,
      required this.width,
      required this.height,
      required this.decoration,
      required this.link,
      required this.text,
      required this.textcolor,
      required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => link));
      },
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      child: Ink(
        decoration: decoration,
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
                fontFamily: GoogleFonts.macondoSwashCaps().fontFamily,
                fontSize: fontSize,
                color: textcolor),
          ),
        ),
      ),
    );
  }
}
