import 'package:flutter/material.dart';
import 'package:scriba_app/defaults/config.dart';
import 'package:scriba_app/defaults/theme.dart';

class NoInternetConn extends StatefulWidget {
  const NoInternetConn({Key? key}) : super(key: key);

  @override
  State<NoInternetConn> createState() => _NoInternetConnState();
}

class _NoInternetConnState extends State<NoInternetConn> {
  late Image backImg;
  @override
  void initState() {
    backImg = Image.asset("assets/images/Back-dark.png");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(backImg.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.black,
            child: Stack(children: <Widget>[
              Container(
                constraints: BoxConstraints.expand(),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/Back-dark.png"),
                      fit: BoxFit.cover),
                ),
                child: backImg,
              ),
              // Positioned.fill(
              //   child: Image.asset('assets/images/Back-dark.png',
              //       fit: BoxFit.fitWidth),
              // ),
              Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                //physics: const NeverScrollableScrollPhysics(),
                children: [
                  Image.asset(
                    "assets/images/wifi.png",
                    height: 120,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "No Internet",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppTheme.moderateOrange,
                        fontSize: 30,
                        fontFamily: AppTheme.macondoFont.fontFamily),
                  )
                ],
              )),
            ])));
  }
}
