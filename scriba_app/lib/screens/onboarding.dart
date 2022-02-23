import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import '/defaults/theme.dart';

import 'homepage.dart';

class OnBoardingScreen extends StatelessWidget {
  final onboardingPages = [
    PageViewModel(
      pageBackground: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Back-dark.png"),
                fit: BoxFit.cover)),
      ),
      bubble: Image.asset('assets/images/onboarding/Hand.png'),
      title: const Text(
        'Scan Hieroglyphs',
      ),
      titleTextStyle: const TextStyle(
          fontFamily: 'MyFont', color: Colors.white, fontSize: 30),
      mainImage: Image.asset(
        'assets/images/onboarding/Hand.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
    ),
    PageViewModel(
      pageBackground: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Back-dark.png"),
                fit: BoxFit.cover)),
      ),
      iconImageAssetPath: 'assets/images/onboarding/Pyramid_Temple.png',
      title: const Text(
        'Know more about Egyptian history',
      ),
      mainImage: Image.asset(
        'assets/images/onboarding/Pyramid_Temple.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: const TextStyle(
        fontFamily: 'MyFont',
        color: Colors.white,
        fontSize: 30,
      ),
    ),
    PageViewModel(
      pageBackground: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Back-dark.png"),
                fit: BoxFit.cover)),
      ),
      iconImageAssetPath: 'assets/images/onboarding/translate.png',
      title: const Text(
        'Translate Hieroglyphs',
      ),
      mainImage: Image.asset(
        'assets/images/onboarding/translate.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: const TextStyle(
          fontFamily: 'MyFont', color: Colors.white, fontSize: 30),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => IntroViewsFlutter(
          onboardingPages,
          showNextButton: true,
          showBackButton: true,
          nextText: Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.amber,
          ),
          backText: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.amber,
          ),
          doneText: Text("Get Started"),
          onTapDoneButton: () {
            // Use Navigator.pushReplacement if you want to dispose the latest route
            // so the user will not be able to slide back to the Intro Views.
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => Homepage()),
            );
          },
          pageButtonTextStyles: const TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
