import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scriba_app/defaults/config.dart';
import 'package:scriba_app/defaults/theme.dart';
import 'package:scriba_app/widgets/app_cards.dart';

class SingleMyth extends StatelessWidget {
  const SingleMyth({Key? key}) : super(key: key);

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
                    child: Image.asset(
                  "assets/images/isis.png",
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
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
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
