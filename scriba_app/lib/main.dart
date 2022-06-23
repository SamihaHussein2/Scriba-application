import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scriba_app/provider/google_login_notifier.dart';
import 'package:scriba_app/provider/myth_notifier.dart';
import 'package:scriba_app/screens/auth_wrapper.dart';
import 'package:scriba_app/screens/edit_profile.dart';
import 'package:scriba_app/screens/navscreens/history.dart';
import 'package:scriba_app/screens/navscreens/myth_page.dart';
import 'package:scriba_app/screens/settings.dart';
import 'package:scriba_app/screens/single_myth_page.dart';
import 'package:scriba_app/screens/navscreens/account.dart';
import 'package:scriba_app/screens/onboarding/intro.dart';
import 'package:provider/provider.dart';
import 'package:scriba_app/services/auth_service.dart';
import '/screens/navscreens/mainpage.dart';
import '/screens/navscreens/homepage.dart';
import '/screens/translation.dart';

import 'defaults/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      Provider<AuthService>(
        create: (_) => AuthService(FirebaseAuth.instance),
      ),
      ChangeNotifierProvider(
        create: (_) => MythNotifier(),
      ),
      // ChangeNotifierProvider(create: (context) => GoogleLoginNotifier()),
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

final navigatorKey = GlobalKey<NavigatorState>();

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
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Scriba App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: Splash(),
      home: AuthWrapper(),
    );
  }
}
