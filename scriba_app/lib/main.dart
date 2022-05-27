import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scriba_app/provider/myth_notifier.dart';
import 'package:scriba_app/screens/edit_profile.dart';
import 'package:scriba_app/screens/navscreens/history.dart';
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
        create: (_) => MythNotifier(),
      ),
    ],
    child: MyApp(),
  ));

  //runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Future<void> mythNotifier =
        Provider.of<MythNotifier>(context, listen: false).fetchMyths();
    super.initState();
  }

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
      home: StreamBuilder<User?>(
        // Needs efiting (when logged in --> account page kamla,  when guest --> account page zay ely fl open day version)
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MainPage();
          } else
            return Splash();
        },
      ),
    );
  }
}
