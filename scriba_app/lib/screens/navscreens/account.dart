import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:scriba_app/defaults/splash.dart';
import 'package:scriba_app/defaults/theme.dart';
import 'package:scriba_app/screens/edit_profile.dart';
import 'package:scriba_app/screens/login.dart';
import 'package:scriba_app/screens/onboarding/intro.dart';
import 'package:scriba_app/services/auth_service.dart';
import 'package:scriba_app/services/user_service.dart';
import 'package:scriba_app/widgets/edit_profile_containers.dart';
import 'package:scriba_app/widgets/sharing_links.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../defaults/config.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  // Add link app in play store when deployed
  String appURL = "link Scriba app in play store";
  String FeedbackURL =
      "https://docs.google.com/forms/d/e/1FAIpQLScpldHNCspTFKqV0BStINBo0XYNs5wbOGZiV3NtE6CXvuS5uw/viewform?usp=sf_link";

  _launchURL() async {
    final Uri _url = Uri.parse(FeedbackURL);
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  //print(userID);
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
    final userID = FirebaseAuth.instance.currentUser?.uid;
    print(userID);
    final users = FirebaseFirestore.instance.collection('Users');
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
                FutureBuilder<DocumentSnapshot>(
                  future: users.doc(userID).get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text("Something went wrong");
                    }

                    if (snapshot.hasData && !snapshot.data!.exists) {
                      return Text("Document does not exist");
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      Map<String, dynamic> data =
                          snapshot.data!.data() as Map<String, dynamic>;

                      return Text(
                        "${data['name']}",
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: GoogleFonts.macondoSwashCaps().fontFamily,
                          color: AppTheme.darkRed,
                        ),
                      );
                    }
                    return Text("loading");
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20,
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
                  // EditContainer(
                  //     icon: Icons.mode_edit_outline_outlined,
                  //     text: "Edit profile",
                  //     dest: EditProfile()),
                  // SizedBox(
                  //   height: 30,
                  // ),
                  Card(
                    color: AppTheme.darkRed,
                    child: ListTile(
                      onTap: () {
                        _launchURL();
                      },
                      leading: Icon(Icons.thumbs_up_down_rounded),
                      iconColor: AppTheme.moderateOrange,
                      title: Text(
                        "Feedback",
                        style: TextStyle(
                            fontFamily:
                                GoogleFonts.macondoSwashCaps().fontFamily,
                            fontSize: 25,
                            color: AppTheme.moderateOrange),
                      ),
                    ),
                    margin: EdgeInsets.only(left: 30, right: 30),
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppTheme.moderateOrange)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SharingLinks(
                      icon: Icons.share_rounded,
                      text: "Share App",
                      url: appURL),
                  SizedBox(
                    height: 30,
                  ),
                  Card(
                    color: AppTheme.darkRed,
                    child: ListTile(
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => IntroPage()));
                      },
                      leading: Icon(Icons.logout),
                      iconColor: AppTheme.moderateOrange,
                      title: Text(
                        "Logout",
                        style: TextStyle(
                            fontFamily:
                                GoogleFonts.macondoSwashCaps().fontFamily,
                            fontSize: 25,
                            color: AppTheme.moderateOrange),
                      ),
                    ),
                    margin: EdgeInsets.only(left: 30, right: 30),
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppTheme.moderateOrange)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    color: AppTheme.darkRed,
                    child: ListTile(
                      onTap: () async {
                        final check =
                            await context.read<AuthService>().deleteAccount();
                        await DeleteUserFromFirestore();

                        print(check);

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      leading: Icon(Icons.delete),
                      iconColor: AppTheme.moderateOrange,
                      title: Text(
                        "Delete Account",
                        style: TextStyle(
                            fontFamily:
                                GoogleFonts.macondoSwashCaps().fontFamily,
                            fontSize: 25,
                            color: AppTheme.moderateOrange),
                      ),
                    ),
                    margin: EdgeInsets.only(left: 30, right: 30),
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppTheme.moderateOrange)),
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
