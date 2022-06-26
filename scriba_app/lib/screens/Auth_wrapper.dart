import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scriba_app/defaults/no_internet.dart';
import 'package:scriba_app/defaults/splash.dart';
import 'package:scriba_app/screens/navscreens/homepage.dart';
import 'package:scriba_app/services/user_service.dart';
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser?.uid;
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return Homepage();
          }
          if (user != null) {
            GetID(user);
            print(user);
            return Homepage();
          } else {
            return Splash();
          }
        });
  }
}
