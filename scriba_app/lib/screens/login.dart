//import 'dart:ffi';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:scriba_app/defaults/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scriba_app/main.dart';
import 'package:scriba_app/screens/navscreens/homepage.dart';
import 'package:scriba_app/screens/navscreens/mainpage.dart';
import 'package:scriba_app/screens/signup.dart';
import 'package:scriba_app/services/auth_service.dart';
import 'package:scriba_app/services/user_service.dart';

class Login extends StatefulWidget {
  static const String id = 'Login';

  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Back-light.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
            ),
            Container(
              height: 180,
              decoration: BoxDecoration(
                color: AppTheme.darkRed,
                borderRadius: new BorderRadius.only(
                    bottomLeft: const Radius.circular(50.0),
                    bottomRight: const Radius.circular(50.0)),
                image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"), scale: 1),
              ),
            ),
            //const SizedBox(height: 20),

            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          // #email, #password
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  decoration: BoxDecoration(
                                      color: AppTheme.moderateOrange,
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: AppTheme.darkRed)),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Can't be empty";
                                      } else if (EmailValidator.validate(
                                              value) ==
                                          false) {
                                        return 'Please Enter valid email';
                                      }
                                      return null;
                                    },
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      //border: OutlineInputBorder(),
                                      hintText: "Email",
                                      hintStyle: TextStyle(
                                        color: AppTheme.darkRed,
                                        fontFamily:
                                            AppTheme.macondoFont.fontFamily,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  decoration: BoxDecoration(
                                      color: AppTheme.moderateOrange,
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: AppTheme.darkRed)),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Can't be empty";
                                      } else if (value.length < 6) {
                                        return 'too short';
                                      }
                                      return null;
                                    },
                                    obscureText: true,
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                      //border: OutlineInputBorder(),
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                        color: AppTheme.darkRed,
                                        fontFamily:
                                            AppTheme.macondoFont.fontFamily,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          // #login
                          Container(
                            child: Center(
                              child: ElevatedButton(
                                child: const Text("Login"),
                                style: AppTheme.buttonStyle,
                                onPressed: () async {
                                  if (_formkey.currentState!.validate()) {
                                    final check = await context
                                        .read<AuthService>()
                                        .signIn(
                                          emailController.text.trim(),
                                          passwordController.text.trim(),
                                        );
                                    final snackBar = SnackBar(
                                      content: Text(check.toString()),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);

                                    if (check.toString() == "Signed in") {
                                      GetID(FirebaseAuth
                                          .instance.currentUser?.uid);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Homepage()));
                                    }
                                  }
                                },
                              ),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: ElevatedButton.icon(
                                icon: FaIcon(
                                  FontAwesomeIcons.google,
                                  size: 15,
                                ),
                                label: const Text("Login with Gmail"),
                                style: AppTheme.buttonStyle,
                                onPressed: () async {
                                  var result = await context
                                      .read<AuthService>()
                                      .signInWithGoogle();

                                  if (result.additionalUserInfo!.isNewUser) {
                                    AddUserInFirestoreGoogle(
                                        FirebaseAuth.instance.currentUser);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Homepage()));
                                  } else {
                                    GetID(
                                        FirebaseAuth.instance.currentUser?.uid);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            //change page to the homepage
                                            builder: (context) => Homepage()));
                                    //Perform what you want to do for old users here
                                    //like fetching a specific user document

                                  }
                                },
                              ),
                            ),
                          ),
                          RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      fontFamily:
                                          AppTheme.macondoFont.fontFamily,
                                      color: AppTheme.darkRed,
                                      fontSize: 17),
                                  text: "You don't have an Account?",
                                  children: [
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => Signup()));
                                      },
                                    text: "Register",
                                    style: TextStyle(
                                        fontFamily:
                                            AppTheme.macondoFont.fontFamily,
                                        decoration: TextDecoration.underline)),
                              ]))
                          // const SizedBox(height: 10),
                          // Row(children: <Widget>[
                          //   Expanded(
                          //     child: new Container(
                          //         margin: const EdgeInsets.only(
                          //             left: 10.0, right: 20.0),
                          //         child: Divider(
                          //           color: Colors.black,
                          //           height: 36,
                          //         )),
                          //   ),
                          //   Text(
                          //     "OR",
                          //     style: GoogleFonts.macondoSwashCaps(),
                          //   ),
                          //   Expanded(
                          //     child: new Container(
                          //         margin: const EdgeInsets.only(
                          //             left: 20.0, right: 10.0),
                          //         child: Divider(
                          //           color: Colors.black,
                          //           height: 36,
                          //         )),
                          //   ),
                          // ]),
                          // Container(
                          //     alignment: Alignment.center,
                          //     child: Center(
                          //       child: ElevatedButton(
                          //         child: const Text("Login with Google"),
                          //         style: AppTheme.buttonStyle,
                          //         onPressed: () {
                          //           Navigator.push(
                          //             context,
                          //             MaterialPageRoute(builder: (_) => Login()),
                          //           );
                          //         },
                          //       ),
                          //     )),
                          // const SizedBox(height: 10),
                          // Container(
                          //     alignment: Alignment.center,
                          //     child: Center(
                          //       child: ElevatedButton(
                          //         child: const Text("Login with phone number"),
                          //         style: AppTheme.buttonStyle,
                          //         onPressed: () {
                          //           Navigator.push(
                          //             context,
                          //             MaterialPageRoute(builder: (_) => Login()),
                          //           );
                          //         },
                          //       ),
                          //     ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Future signIn() async {
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text.trim(),
  //       password: passwordController.text.trim(),
  //     );

  //     print("Doneee");
  //     Navigator.push(context, MaterialPageRoute(builder: (_) => Homepage()));
  //   } on FirebaseAuthException catch (e) {
  //     print(e);
  //     //print("error");
  //   }
  // }
}
