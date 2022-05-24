import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:scriba_app/provider/myth_notifier.dart';
import 'package:scriba_app/screens/single_myth_page.dart';
import 'package:scriba_app/widgets/app_cards.dart';
import '/defaults/theme.dart';

import '/defaults/config.dart';
import 'homepage.dart';

class MythScreen extends StatefulWidget {
  const MythScreen({Key? key}) : super(key: key);

  @override
  State<MythScreen> createState() => _MythScreenState();
}

class _MythScreenState extends State<MythScreen> {
  @override
  Widget build(BuildContext context) {
    MythNotifier mythNotifier = Provider.of<MythNotifier>(context);

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
          // child: Column(
          //   children: <Widget>[
          //     AppCard(
          //       title: "Royal Ramses II",
          //       subtitle: "Ahmose I, king of ancient Egypt..",
          //       dest: SingleMyth(),
          //     ),
          //     AppCard(
          //       title: "Isis & Osiris",
          //       subtitle:
          //           "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet",
          //       dest: SingleMyth(),
          //     ),
          //     AppCard(
          //       title: "Royal Ahmose I",
          //       subtitle:
          //           "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet",
          //       dest: SingleMyth(),
          //     )
          //   ],
          // )
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return AppCard(
                title: mythNotifier.mythList[index].title,
                subtitle: mythNotifier.mythList[index].subtitle,
                dest: SingleMyth(),
              );
            },
            itemCount: mythNotifier.mythList.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: AppTheme.moderateOrange,
              );
            },
          ),
        ));
  }
}
