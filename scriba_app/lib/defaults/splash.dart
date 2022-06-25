import 'package:flutter/material.dart';
import 'package:scriba_app/defaults/config.dart';
import 'package:scriba_app/defaults/theme.dart';
import 'package:scriba_app/screens/onboarding/onboarding.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    backImg = Image.asset("assets/images/Back-dark.png", fit: BoxFit.fitWidth);
    Future.delayed(Duration(seconds: 6), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => OnBoardingScreen()),
      );
    });

    super.initState();
  }

  late Image backImg;

  @override
  void didChangeDependencies() {
    precacheImage(backImg.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: Container(
            color: Colors.black,
            child: Stack(children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/Back-dark.png"),
                        fit: BoxFit.fitWidth)),
                child: backImg,
              ),
              Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                    Center(
                      child: Image.asset(
                        "assets/images/logo.png",
                        width: SizeConfig.screenWidth / 2,
                      ),
                    ),
                  ]))
            ])));
  }
}
