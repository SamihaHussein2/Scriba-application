import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scriba_app/provider/myth_notifier.dart';
import 'package:scriba_app/screens/edit_profile.dart';
import 'package:scriba_app/screens/navscreens/myth_page.dart';
import 'package:scriba_app/screens/single_myth_page.dart';
import 'package:scriba_app/screens/navscreens/account.dart';
import 'package:scriba_app/screens/onboarding/intro.dart';
import 'package:provider/provider.dart';
import '/screens/navscreens/mainpage.dart';
import '/screens/navscreens/homepage.dart';
import '/screens/translation.dart';

import 'defaults/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => MythNotifier(),
      ),
    ],
    child: MyApp(),
  ));

  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}
