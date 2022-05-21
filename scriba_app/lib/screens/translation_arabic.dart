import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scriba_app/screens/translation.dart';
import 'package:scriba_app/widgets/translation_card.dart';
import '/defaults/theme.dart';

import '../defaults/config.dart';

class TranslationScreenArabic extends StatelessWidget {
  const TranslationScreenArabic({Key? key}) : super(key: key);

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
        body: TranslationWidget(
            dir: TextAlign.right,
            title: "الترجمة\n",
            subtitle:
                "خسائر اللازمة ومطالبة حدة بل. الآخر الحلفاء أن غزو، إجلاء وتنامت عدد مع. لقهر معركة لبلجيكا، بـ انه، ",
            tootltip: "الترجمة بالانجليزية",
            dest: TranslationScreen(),
            align: Alignment.topLeft));
  }
}
