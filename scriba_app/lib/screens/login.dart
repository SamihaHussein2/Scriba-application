//import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scriba_app/defaults/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scriba_app/screens/navscreens/homepage.dart';
import 'package:scriba_app/screens/navscreens/mainpage.dart';

class Login extends StatefulWidget {
  static const String id = 'Login';

  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //const SizedBox(height: 10),
            // #login, #welcome
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
              // crossAxisAlignment: CrossAxisAlignment.start,
              // children: <Widget>[
              //   ClipRRect(
              //     borderRadius: BorderRadius.only(
              //       bottomLeft: Radius.circular(60),
              //       bottomRight: Radius.circular(60),
              //     ),
              //     child: Image.asset('assets/images/logo.png'),
              //   )
              // ],
            ),
            //const SizedBox(height: 20),

            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
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
                                child: TextField(
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
                                child: TextField(
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
                              onPressed: signIn,
                            ),
                          ),
                        ),

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
          ],
        ),
      ),
    );
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      print("Doneee");
      Navigator.push(context, MaterialPageRoute(builder: (_) => Homepage()));
    } on FirebaseAuthException catch (e) {
      print(e);
      //print("error");
    }
  }
}
