import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scriba_app/defaults/config.dart';
import 'package:scriba_app/screens/navscreens/myth.dart';
import 'package:scriba_app/screens/translation_arabic.dart';
import '/defaults/theme.dart';

class TranslationRoyalsScreenArabic extends StatelessWidget {
  const TranslationRoyalsScreenArabic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Translation of Hieroglyph",
              style: TextStyle(
                  color: AppTheme.moderateOrange,
                  fontSize: 25,
                  fontFamily: GoogleFonts.macondoSwashCaps().fontFamily)),
          centerTitle: true,
          backgroundColor: AppTheme.darkRed,
        ),
        body: Container(
            // constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Back-dark.png"),
                    fit: BoxFit.cover)),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 170,
                  child: Card(
                    color: Colors.transparent,
                    child: ListTile(
                      title: Text(
                        "Myth\n",
                        style: TextStyle(
                          color: AppTheme.moderateOrange,
                          fontFamily: AppTheme.macondoFont.fontFamily,
                          fontSize: 25,
                        ),
                      ),
                      subtitle: Text(
                        "Lorem ipsum dolor sit amet.",
                        style: TextStyle(
                          color: AppTheme.moderateOrange,
                          fontFamily: AppTheme.macondoFont.fontFamily,
                          fontSize: 18,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_horiz),
                        color: AppTheme.moderateOrange,
                      ),
                    ),
                    margin: EdgeInsets.only(
                        top: 40, left: 20, right: 20, bottom: 20),
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppTheme.moderateOrange)),
                  ),
                ),
                // ElevatedButton.icon(
                //     onPressed: () {},
                //     icon: Icon(Icons.translate),
                //     label: Text('Translate to Arabic')),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                    style: AppTheme.buttonStyle,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => MythScreen()),
                      );
                    },
                    icon: Icon(Icons.view_agenda_sharp),
                    label: Text(
                      'See Other Royals & Myth',
                    )),
              ],
            )));
  }
}
