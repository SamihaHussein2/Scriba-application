import 'package:flutter/material.dart';

import '../../../defaults/theme.dart';
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
          text!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: AppTheme.macondoFont.fontFamily,
            fontSize: getProportionateScreenWidth(30),
            color: AppTheme.moderateOrange,
          ),
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
