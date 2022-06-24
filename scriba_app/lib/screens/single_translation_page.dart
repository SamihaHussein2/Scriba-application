import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scriba_app/screens/navscreens/history.dart';
import 'package:scriba_app/screens/navscreens/homepage.dart';
import 'package:scriba_app/screens/navscreens/mainpage.dart';
import 'package:scriba_app/screens/translation_arabic.dart';
import 'package:scriba_app/services/translation_service.dart';
import 'package:scriba_app/widgets/translation_card.dart';
import '/defaults/theme.dart';

import '../defaults/config.dart';

class TranslationScreen extends StatelessWidget {
  const TranslationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var output = displayTranslation();
    SizeConfig().init(context);
    return TranslationWidget(
        saveDest: Homepage(),
        btnText: "Save This Translation",
        appbarText: "Translation of Hireoglyph",
        align: Alignment.topRight,
        dir: TextAlign.left,
        title: "Translation\n",
        subtitle: output,
        // "Lorem ipsum dolor sit amet. Aut molestiae consequuntur et praesentium quibusdam ad quis veritatis est dolorum.",
        tootltip: "Translate to Arabic",
        dest: TranslationScreenArabic());
  }
}
