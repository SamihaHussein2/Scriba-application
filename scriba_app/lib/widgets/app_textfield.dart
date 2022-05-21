import 'package:flutter/material.dart';
import 'package:scriba_app/defaults/theme.dart';

class AppTextField extends StatelessWidget {
  final Color borderColor;
  final Color textColor;
  final Color fillColor;
  final String text;

  const AppTextField(
      {Key? key,
      required this.borderColor,
      required this.textColor,
      required this.fillColor,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField();
  }
}
