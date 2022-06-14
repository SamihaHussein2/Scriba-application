import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scriba_app/defaults/splash.dart';
import 'package:scriba_app/screens/navscreens/homepage.dart';
import 'package:scriba_app/services/user_service.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser?.uid;
    if (user != null) {
      GetID(user);
      print(user);
      return Homepage();
    }
    return Splash();
  }
}
