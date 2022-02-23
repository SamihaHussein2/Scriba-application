import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:scriba_test/defaults/theme.dart';
import '../screens/onboarding.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: AnimatedSplashScreen(
        duration: 3000,
        splash: Image.asset('assets/images/logo.png'),
        nextScreen: OnBoardingScreen(),
        splashTransition: SplashTransition.fadeTransition,
      ),
    ));
  }
}
