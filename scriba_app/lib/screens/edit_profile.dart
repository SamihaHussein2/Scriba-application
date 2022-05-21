import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scriba_app/defaults/theme.dart';
import 'package:scriba_app/screens/navscreens/account.dart';
import 'package:scriba_app/screens/navscreens/homepage.dart';
import 'package:scriba_app/screens/navscreens/mainpage.dart';
import 'package:scriba_app/widgets/app_btn.dart';
import 'package:scriba_app/widgets/app_textfield.dart';

import '../../defaults/config.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _AccountPageState();
}

_Update() {
  print("Hi There");
}

class _AccountPageState extends State<EditProfile> {
  // late Image myImage;
  // @override
  // void initState() {
  //   super.initState();
  //   myImage = Image.asset("assets/images/Back-light.png");
  // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   precacheImage(myImage.image, context);
  // }

  @override
  Widget build(BuildContext context) {
    //precacheImage(AssetImage("assets/images/Back-light.png"), context);
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.darkRed,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios_new_outlined,
              color: AppTheme.moderateOrange),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        // constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Back-light.png"),
                fit: BoxFit.cover)),
        child: ListView(
          children: [
            Column(
              ///crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(padding: EdgeInsets.only(bottom: 40)),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "John Doe",
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: GoogleFonts.macondoSwashCaps().fontFamily,
                    color: AppTheme.darkRed,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: AppTheme.darkRed,
                boxShadow: [
                  BoxShadow(color: AppTheme.darkRed, spreadRadius: 5),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Container(
                    width: 350,
                    child: Column(
                      children: [
                        AppTextField(
                          obscureText: false,
                          fillColor: AppTheme.moderateOrange,
                          textColor: AppTheme.moderateOrange,
                          text: "John Doe",
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        AppTextField(
                          obscureText: false,
                          fillColor: AppTheme.moderateOrange,
                          textColor: AppTheme.moderateOrange,
                          text: "John123@gmail.com",
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        AppTextField(
                            obscureText: true,
                            fillColor: AppTheme.moderateOrange,
                            textColor: AppTheme.moderateOrange,
                            text: "*****"),
                        SizedBox(
                          height: 40,
                        ),
                        AppBtn(
                            fontSize: 20,
                            textcolor: AppTheme.darkRed,
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  AppTheme.moderateOrange,
                                  AppTheme.gradientColor,
                                  AppTheme.moderateOrange,
                                ]),
                                borderRadius: BorderRadius.circular(20)),
                            link: Homepage(),
                            text: "Update Account"),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
