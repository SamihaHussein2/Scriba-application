import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:scriba_app/defaults/splash.dart';

import '../../defaults/config.dart';
import '../../defaults/theme.dart';
import '../navscreens/homepage.dart';
import '../login.dart';

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
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 210),
                      Center(
                        child: Image.asset(
                          "assets/images/logo.png",
                          width: 270,
                        ),
                      ),
                      SizedBox(height: 180),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            height: 50,
                            child: ElevatedButton(
                              child: const Text("Create Account"),
                              style: AppTheme.buttonStyle,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => Login()),
                                );
                              },
                            ),
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            height: 50,
                            child: ElevatedButton(
                              child: const Text("Login"),
                              style: AppTheme.buttonStyle,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => Login()),
                                );
                              },
                            ),
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            height: 50,
                            child: ElevatedButton(
                              child: const Text("Continue as a guest"),
                              style: AppTheme.buttonGolden,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => Homepage()),
                                );
                              },
                            ),
                          )),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}
