import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scriba_app/screens/myth_page.dart';
import 'package:scriba_app/widgets/app_cards.dart';
import '/defaults/theme.dart';

import '/defaults/config.dart';
import 'homepage.dart';

class MythScreen extends StatelessWidget {
  const MythScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Myth",
              style: TextStyle(
                  color: AppTheme.moderateOrange,
                  fontSize: 25,
                  fontFamily: GoogleFonts.macondoSwashCaps().fontFamily)),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Container(

            // constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Back-dark.png"),
                    fit: BoxFit.cover)),
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              children: <Widget>[
                AppCard(
                  title: "Royal Ramses II",
                  subtitle:
                      "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet",
                  dest: SingleMyth(),
                ),
                AppCard(
                  title: "Isis & Osiris",
                  subtitle:
                      "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet",
                  dest: SingleMyth(),
                ),
                AppCard(
                  title: "Royal Ahmose I",
                  subtitle:
                      "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet",
                  dest: SingleMyth(),
                )
              ],
            )));
  }
}
