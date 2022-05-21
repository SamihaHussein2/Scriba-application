import 'package:flutter/material.dart';
import 'package:scriba_app/screens/Royals_Pages/translation_royals.dart';
import 'package:scriba_app/screens/edit_profile.dart';
import 'package:scriba_app/screens/myth_page.dart';
import 'package:scriba_app/screens/onboarding/intro.dart';

import '/screens/navscreens/mainpage.dart';
import '/screens/navscreens/homepage.dart';
import '/screens/translation.dart';

import 'defaults/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}
