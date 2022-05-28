import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scriba_app/defaults/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scriba_app/screens/login.dart';
import 'package:scriba_app/widgets/app_btn.dart';

class Signup extends StatefulWidget {
  static const String id = 'Signup';

  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

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
              height: 170,
              decoration: BoxDecoration(
                color: AppTheme.darkRed,
                borderRadius: new BorderRadius.only(
                    bottomLeft: const Radius.circular(50.0),
                    bottomRight: const Radius.circular(50.0)),
                image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(height: 20),
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
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    //border: OutlineInputBorder(),
                                    hintText: "Name",
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
                                  controller: emailController,
                                  decoration: InputDecoration(
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
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    hintText: "Password",
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
                                  decoration: InputDecoration(
                                    hintText: "Confirm Password",
                                    hintStyle: TextStyle(
                                      color: AppTheme.darkRed,
                                      fontFamily:
                                          AppTheme.macondoFont.fontFamily,
                                    ),
                                  ),
                                  // decoration: InputDecoration(
                                  //     hintText: "Confirm Password",
                                  //     hintStyle: TextStyle(
                                  //         //fontFamily: GoogleFonts.macondoSwashCaps().fontFamily,
                                  //         color: AppTheme.darkRed),
                                  //     border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        // #login
                        Container(
                          child: AppBtn(
                              width: 300,
                              height: 50,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  AppTheme.darkRed,
                                  AppTheme.darkRed,
                                  AppTheme.darkRed,
                                ]),
                                border: Border.all(
                                    width: 2, color: AppTheme.moderateOrange),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              link: Login(),
                              text: "Login",
                              textcolor: AppTheme.moderateOrange,
                              fontSize: 20),
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
                        //         child: const Text("Sign up with Google"),
                        //         style: AppTheme.buttonStyle,
                        //         onPressed: () {
                        //           Navigator.push(
                        //             context,
                        //             MaterialPageRoute(builder: (_) => Signup()),
                        //           );
                        //         },
                        //       ),
                        //     )),
                        // const SizedBox(height: 10),
                        // Container(
                        //     alignment: Alignment.center,
                        //     child: Center(
                        //       child: ElevatedButton(
                        //         child: const Text("Sign up with phone number"),
                        //         style: AppTheme.buttonStyle,
                        //         onPressed: () {
                        //           Navigator.push(
                        //             context,
                        //             MaterialPageRoute(builder: (_) => Signup()),
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
}
