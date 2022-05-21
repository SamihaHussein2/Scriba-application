import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scriba_app/screens/translation.dart';
import 'package:scriba_app/widgets/app_cards.dart';
import '/defaults/theme.dart';

import '/defaults/config.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Saved Translation",
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
            padding: const EdgeInsets.only(top: 90),
            child: Column(
              children: <Widget>[
                AppCard(
                  title: "",
                  subtitle: "Lorem ipsum dolor sit amet.",
                  dest: TranslationScreen(),
                ),
                AppCard(
                  title: "",
                  subtitle: "Lorem ipsum dolor sit amet.",
                  dest: TranslationScreen(),
                ),
                AppCard(
                  title: "",
                  subtitle: "Lorem ipsum dolor sit amet.",
                  dest: TranslationScreen(),
                ),
              ],
            )));
  }
}
