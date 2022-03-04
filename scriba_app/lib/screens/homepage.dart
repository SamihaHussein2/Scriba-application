import 'package:flutter/material.dart';
import '/widgets/button_widget.dart';

import '../main.dart';
import 'onboarding/onboarding.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/Back-dark.png"),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'HomePage',
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              ButtonWidget(
                text: 'Go Back',
                onClicked: () => goToOnBoarding(context),
              ),
            ],
          ),
        ),
      );

  void goToOnBoarding(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => OnBoardingScreen()),
      );
}
