import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scriba_app/screens/navscreens/history.dart';
import 'package:scriba_app/screens/navscreens/homepage.dart';
import 'package:scriba_app/screens/navscreens/mainpage.dart';
import 'package:scriba_app/screens/single_translation_page.dart';
import 'package:scriba_app/widgets/translation_card.dart';
import '/defaults/theme.dart';

import '../defaults/config.dart';

class TranslationScreenArabic extends StatelessWidget {
  const TranslationScreenArabic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return TranslationWidget(
        saveDest: Homepage(),
        btnText: "Save This Translation",
        appbarText: "Translation of Hireoglyph",
        dir: TextAlign.right,
        title: "الترجمة\n",
        subtitle:
            "خسائر اللازمة ومطالبة حدة بل. الآخر الحلفاء أن غزو، إجلاء وتنامت عدد مع. لقهر معركة لبلجيكا، بـ انه، ",
        tootltip: "الترجمة بالانجليزية",
        dest: TranslationScreen(),
        align: Alignment.topLeft);
  }
}
