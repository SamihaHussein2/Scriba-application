import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scriba_app/defaults/theme.dart';
import 'package:share_plus/share_plus.dart';

// this class is responsible of designing the widgets of edit profile page
class SharingLinks extends StatelessWidget {
  final IconData icon;
  final String text;
  final String url;

  const SharingLinks(
      {Key? key, required this.icon, required this.text, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.darkRed,
      child: ListTile(
        onTap: () {
          Share.share(url);
        },
        leading: Icon(icon),
        iconColor: AppTheme.moderateOrange,
        title: Text(
          text,
          style: TextStyle(
              fontFamily: GoogleFonts.macondoSwashCaps().fontFamily,
              fontSize: 25,
              color: AppTheme.moderateOrange),
        ),
      ),
      margin: EdgeInsets.only(left: 30, right: 30),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppTheme.moderateOrange)),
    );
  }
}
