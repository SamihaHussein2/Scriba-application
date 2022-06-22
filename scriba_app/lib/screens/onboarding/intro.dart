import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:scriba_app/defaults/splash.dart';
import 'package:scriba_app/screens/navscreens/mainpage_unregistered.dart';
import 'package:scriba_app/widgets/app_btn.dart';

import '../../defaults/config.dart';
import '../../defaults/theme.dart';
import '../login.dart';
import '../signup.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double textSize = SizeConfig.screenWidth / 2;
    return Scaffold(
        body: Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Back-dark.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: SizeConfig.screenHeight / 4,
                  ),
                  Expanded(
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: SizeConfig.screenWidth * 0.5,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      //physics: NeverScrollableScrollPhysics(),
                      //mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppBtn(
                          // width: 300,
                          // height: 50,
                          width: SizeConfig.screenWidth,
                          height: SizeConfig.screenHeight / 15,
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
                          //fontSize: 20
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight / 50,
                        ),
                        AppBtn(
                          width: SizeConfig.screenWidth,
                          height: SizeConfig.screenHeight / 15,
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
                          //fontSize: 20.3
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight / 50,
                        ),
                        AppBtn(
                          width: SizeConfig.screenWidth,
                          height: SizeConfig.screenHeight / 15,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [
                              AppTheme.moderateOrange,
                              AppTheme.gradientColor,
                              AppTheme.moderateOrange,
                            ]),
                            border:
                                Border.all(width: 2, color: Colors.transparent),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          link: HomepageUnregistered(),
                          text: "Continue as a Guest",
                          textcolor: AppTheme.darkRed,
                          //fontSize: 20
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight / 50,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
