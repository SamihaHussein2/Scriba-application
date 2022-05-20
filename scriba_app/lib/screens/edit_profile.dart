import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scriba_app/defaults/theme.dart';
import 'package:scriba_app/screens/navscreens/homepage.dart';

import '../../defaults/config.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _AccountPageState();
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
        leading: Icon(Icons.arrow_back_ios_new_outlined),
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
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Container(
                    width: 350,
                    child: Column(
                      children: [
                        TextFormField(
                          style: TextStyle(color: AppTheme.moderateOrange),
                          decoration: const InputDecoration(
                            hintText: "John Doe",
                            hintStyle: TextStyle(
                              color: AppTheme.moderateOrange,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppTheme.moderateOrange, width: 3.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppTheme.moderateOrange, width: 3.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          style: TextStyle(color: AppTheme.moderateOrange),
                          decoration: const InputDecoration(
                            hintText: "John123@gmail.com",
                            hintStyle: TextStyle(
                              color: AppTheme.moderateOrange,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppTheme.moderateOrange, width: 3.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppTheme.moderateOrange, width: 3.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          style: TextStyle(color: AppTheme.moderateOrange),
                          decoration: const InputDecoration(
                            hintText: "*****",
                            hintStyle: TextStyle(
                              color: AppTheme.moderateOrange,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppTheme.moderateOrange, width: 3.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppTheme.moderateOrange, width: 3.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            print('Hi there');
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  AppTheme.moderateOrange,
                                  AppTheme.gradientColor,
                                  AppTheme.moderateOrange,
                                ]),
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              width: 300,
                              height: 50,
                              alignment: Alignment.center,
                              child: Text(
                                "Update Account",
                                style: TextStyle(
                                    fontFamily: GoogleFonts.macondoSwashCaps()
                                        .fontFamily,
                                    fontSize: 20,
                                    color: AppTheme.darkRed),
                              ),
                            ),
                          ),
                        ),
                        //navBar(),
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
