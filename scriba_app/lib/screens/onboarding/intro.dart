import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:scriba_app/defaults/splash.dart';
import 'package:scriba_app/widgets/app_btn.dart';

import '../../defaults/config.dart';
import '../../defaults/theme.dart';
import '../navscreens/homepage.dart';
import '../login.dart';
import '../signup.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // to be suitable for all mobile screens
    return Scaffold(
        body: Container(
            color: Colors.black,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset('assets/images/Back-dark.png',
                      fit: BoxFit.fitWidth),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 170),
                      Center(
                        child: Image.asset(
                          "assets/images/logo.png",
                          width: 270,
                        ),
                      ),
                      SizedBox(height: 140),
                      Flexible(
                        fit: FlexFit.loose,
                        child: Column(
                          children: [
                            AppBtn(
                                width: 300,
                                height: 50,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(colors: [
                                    AppTheme.darkRed,
                                    AppTheme.darkRed,
                                    AppTheme.darkRed,
                                  ]),
                                  border: Border.all(
                                      width: 2, color: AppTheme.moderateOrange),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                link: Signup(),
                                text: "Create an Account",
                                textcolor: AppTheme.moderateOrange,
                                fontSize: 20),
                            SizedBox(
                              height: 10,
                            ),
                            AppBtn(
                                width: 300,
                                height: 50,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(colors: [
                                    AppTheme.darkRed,
                                    AppTheme.darkRed,
                                    AppTheme.darkRed,
                                  ]),
                                  border: Border.all(
                                      width: 2, color: AppTheme.moderateOrange),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                link: Login(),
                                text: "Login",
                                textcolor: AppTheme.moderateOrange,
                                fontSize: 20),
                            SizedBox(
                              height: 10,
                            ),
                            AppBtn(
                                width: 300,
                                height: 50,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(colors: [
                                    AppTheme.moderateOrange,
                                    AppTheme.gradientColor,
                                    AppTheme.moderateOrange,
                                  ]),
                                  border: Border.all(
                                      width: 2, color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                link: Homepage(),
                                text: "Continue as a Guest",
                                textcolor: AppTheme.darkRed,
                                fontSize: 20),
                          ],
                        ),
                      )
                      // Row(
                      //   children: [
                      //     Container(
                      //       alignment: Alignment.center,
                      //       padding: EdgeInsets.only(left: 40),
                      //       //height: 50,
                      //       child: AppBtn(
                      //           width: 300,
                      //           height: 50,
                      //           decoration: BoxDecoration(
                      //             gradient: const LinearGradient(colors: [
                      //               AppTheme.darkRed,
                      //               AppTheme.darkRed,
                      //               AppTheme.darkRed,
                      //             ]),
                      //             border: Border.all(
                      //                 width: 2, color: AppTheme.moderateOrange),
                      //             borderRadius: BorderRadius.circular(20),
                      //           ),
                      //           link: Signup(),
                      //           text: "Create an Account",
                      //           textcolor: AppTheme.moderateOrange,
                      //           fontSize: 20),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Row(
                      //   children: [
                      //     Container(
                      //       alignment: Alignment.center,
                      //       padding: EdgeInsets.only(left: 40),
                      //       //height: 50,
                      //       child: AppBtn(
                      //           width: 300,
                      //           height: 50,
                      //           decoration: BoxDecoration(
                      //             gradient: const LinearGradient(colors: [
                      //               AppTheme.darkRed,
                      //               AppTheme.darkRed,
                      //               AppTheme.darkRed,
                      //             ]),
                      //             border: Border.all(
                      //                 width: 2, color: AppTheme.moderateOrange),
                      //             borderRadius: BorderRadius.circular(20),
                      //           ),
                      //           link: Login(),
                      //           text: "Login",
                      //           textcolor: AppTheme.moderateOrange,
                      //           fontSize: 20),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Row(
                      //   children: [
                      //     Container(
                      //       alignment: Alignment.center,
                      //       padding: EdgeInsets.only(left: 40),
                      //       //height: 50,
                      //       child: AppBtn(
                      //           width: 300,
                      //           height: 50,
                      //           decoration: BoxDecoration(
                      //             gradient: const LinearGradient(colors: [
                      //               AppTheme.moderateOrange,
                      //               AppTheme.gradientColor,
                      //               AppTheme.moderateOrange,
                      //             ]),
                      //             border: Border.all(
                      //                 width: 2, color: Colors.transparent),
                      //             borderRadius: BorderRadius.circular(20),
                      //           ),
                      //           link: Homepage(),
                      //           text: "Continue as a Guest",
                      //           textcolor: AppTheme.darkRed,
                      //           fontSize: 20),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
