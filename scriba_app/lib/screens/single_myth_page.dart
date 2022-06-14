import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:scriba_app/defaults/config.dart';
import 'package:scriba_app/defaults/theme.dart';
import 'package:scriba_app/provider/myth_notifier.dart';
import 'package:scriba_app/widgets/app_cards.dart';

class SingleMyth extends StatelessWidget {
  final int index;
  const SingleMyth({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    MythNotifier mythNotifier = Provider.of<MythNotifier>(context);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
              context.watch<MythNotifier>().mythList.elementAt(index).title,
              style: TextStyle(
                  color: AppTheme.moderateOrange,
                  fontSize: 25,
                  fontFamily: GoogleFonts.macondoSwashCaps().fontFamily)),
          centerTitle: true,
          backgroundColor: AppTheme.darkRedOpacity,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios_new_outlined,
                color: AppTheme.moderateOrange),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/Back-dark.png"),
                  fit: BoxFit.cover)),
          child: Container(
            alignment: Alignment.center,
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                ClipRRect(
                    child: Image.network(
                  context.watch<MythNotifier>().mythList.elementAt(index).image,
                  width: 200,
                  height: 200,
                )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: AppTheme.darkRed,
                  padding:
                      EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 20),
                  margin: EdgeInsets.all(25),
                  //alignment: Alignment.center,
                  child: Text(
                      context
                          .watch<MythNotifier>()
                          .mythList
                          .elementAt(index)
                          .info,
                      style: TextStyle(
                          fontFamily: GoogleFonts.macondoSwashCaps().fontFamily,
                          fontSize: 20,
                          color: AppTheme.moderateOrange)),
                )
              ],
            ),
          ),
        ));
  }
}
