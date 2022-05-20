import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scriba_app/defaults/splash.dart';
import 'package:scriba_app/defaults/theme.dart';
import 'package:scriba_app/screens/edit_profile.dart';
import 'package:scriba_app/widgets/edit_profile_containers.dart';

import '../../defaults/config.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
                Text(
                  "Welcome your majesty",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: GoogleFonts.macondoSwashCaps().fontFamily,
                    color: AppTheme.darkRed,
                  ),
                ),
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
              child: ListView(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  EditContainer(
                      icon: Icons.mode_edit_outline_outlined,
                      text: "Edit profile",
                      dest: EditProfile()),
                  SizedBox(
                    height: 30,
                  ),
                  EditContainer(
                      icon: Icons.thumbs_up_down_rounded,
                      text: "Feedback",
                      dest: EditProfile()),
                  SizedBox(
                    height: 30,
                  ),
                  EditContainer(
                      icon: Icons.share_rounded,
                      text: "Share App",
                      dest: EditProfile()),
                  SizedBox(
                    height: 30,
                  ),
                  EditContainer(
                      icon: Icons.logout, text: "Logout", dest: Splash())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
