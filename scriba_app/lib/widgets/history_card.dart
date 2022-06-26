import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scriba_app/defaults/theme.dart';
import 'package:scriba_app/models/myth.dart';
import 'package:scriba_app/screens/navscreens/history.dart';
import 'package:scriba_app/screens/single_myth_page.dart';
import 'package:scriba_app/screens/single_translation_page.dart';
import 'package:scriba_app/widgets/app_btn.dart';
import 'package:scriba_app/widgets/edit_btn.dart';

class HistoryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  //final Widget dest;
  final String trans;

  HistoryCard({
    Key? key,
    // required this.dest,
    required this.subtitle,
    required this.title,
    required this.trans,
  }) : super(key: key);

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
            trailing: IconButton(
              onPressed: () {
                //code text-to-speech
                // const TranslationScreen();
                speak(trans);
              },
              icon: const ImageIcon(
                AssetImage("assets/images/homepage_icons/speech.png"),
                size: 70,
                color: AppTheme.moderateOrange,
              ),
            ),
          ),
          margin:
              const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 0),
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppTheme.moderateOrange))),
    );
  }

  final FlutterTts flutterTts = FlutterTts();
  speak(word) async {
    //print(await flutterTts.getLanguages);
    await flutterTts.setLanguage("ar-US");
    await flutterTts.setVolume(16);
    await flutterTts.speak(word);
  }
}
