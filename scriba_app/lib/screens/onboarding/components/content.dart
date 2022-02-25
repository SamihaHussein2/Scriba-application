import 'package:flutter/material.dart';

import '/defaults/config.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({Key? key, this.text, this.image}) : super(key: key);

  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          "Scriba",
          style: TextStyle(
              fontSize: getProportionateScreenWidth(36),
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        Text(
          text!,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        Image.asset(
          image!,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        )
      ],
    );
  }
}
