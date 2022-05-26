import '/services/auth_service.dart';
import '/screens/onboarding/intro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'navscreens/homepage.dart';

class AuthStateBuilder extends StatelessWidget {
  const AuthStateBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: AuthService().authChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Homepage();
        }
        return IntroPage();
      },
    );
  }
}
