import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:scriba_app/models/myth.dart';
import 'package:scriba_app/provider/myth_notifier.dart';
import 'package:scriba_app/screens/single_myth_page.dart';
import 'package:scriba_app/widgets/app_cards.dart';
import '/defaults/theme.dart';

import '/defaults/config.dart';
import 'homepage.dart';

class MythScreen extends StatelessWidget {
  const MythScreen({Key? key}) : super(key: key);

  // void initState() {
  //   // Future<void> mythNotifier =
  //   //     Provider.of<MythNotifier>(context, listen: false).fetchMyths(); //here error
  //   super.initState();
  //   Future<void> mythNotifier =
  //       Provider.of<MythNotifier>(context).fetchMyths();
  // }

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
        body: Selector<MythNotifier, List<Myth>>(
            selector: (_, notifier) => notifier.mythList,
            builder: (_, mythList, __) {
              return Container(
                // constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/Back-dark.png"),
                        fit: BoxFit.cover)),
                //padding: const EdgeInsets.only(top: 100),
                child: ListView.builder(
                    itemCount: mythList.length,
                    itemBuilder: (context, index) {
                      return AppCard(
                          title: mythList[index].title,
                          subtitle: mythList[index].subtitle,
                          dest: SingleMyth(index: index));
                    }),
              );
            }));
  }
}
