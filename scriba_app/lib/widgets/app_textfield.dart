import 'package:flutter/material.dart';
import 'package:scriba_app/defaults/theme.dart';

class AppTextField extends StatelessWidget {
  final Color BorderColor;
  final Color TextColor;
  final Color FillColor;
  final String Text;
  const AppTextField(
      {Key? key,
      required this.BorderColor,
      required this.TextColor,
      required this.FillColor,
      required this.Text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField();
  }
}
