import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scriba_app/defaults/theme.dart';

class AppCard extends StatelessWidget {
  String title;
  final String subtitle;
  //final Widget dest;

  AppCard({Key? key, required this.subtitle, required this.title
      //required this.dest
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
          color: Colors.transparent,
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(
                color: AppTheme.moderateOrange,
                fontFamily: AppTheme.macondoFont.fontFamily,
                fontSize: 25,
              ),
            ),
            subtitle: Text(
              subtitle,
              style: TextStyle(
                color: AppTheme.moderateOrange,
                fontFamily: AppTheme.macondoFont.fontFamily,
                fontSize: 18,
              ),
            ),
            trailing: ElevatedButton(
              onPressed: () {
                print('Hi there');
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Ink(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      AppTheme.moderateOrange,
                      AppTheme.gradientColor,
                      AppTheme.moderateOrange,
                    ]),
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  width: 80,
                  height: 40,
                  alignment: Alignment.center,
                  child: Text(
                    "More",
                    style: TextStyle(
                        fontFamily: GoogleFonts.macondoSwashCaps().fontFamily,
                        fontSize: 20,
                        color: AppTheme.darkRed),
                  ),
                ),
              ),
            ),
          ),
          margin: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 0),
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppTheme.moderateOrange))),
    );
  }
}
