import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scriba_app/defaults/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scriba_app/screens/login.dart';
import 'package:scriba_app/screens/navscreens/homepage.dart';
import 'package:scriba_app/services/auth_service.dart';
import 'package:scriba_app/services/user_service.dart';
import 'package:scriba_app/widgets/app_btn.dart';

class Signup extends StatefulWidget {
  static const String id = 'Signup';

  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final confirmPassword = TextEditingController();
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
            Container(
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
                        child: Form(
                          key: _formKey,
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
                                    }
                                    return null;
                                  },
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    //errorText: "Can't be empy",
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
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Can't be empty";
                                    } else if (EmailValidator.validate(value) ==
                                        false) {
                                      return 'Please Enter valid email';
                                    }
                                    return null;
                                  },
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
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Can't be empty";
                                    } else if (value.length <= 6) {
                                      return 'too short';
                                    }
                                    return null;
                                  },
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
                                child: TextFormField(
                                  controller: confirmPassword,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Can't be empty";
                                    } else if (value.length < 6) {
                                      return 'too short';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Confirm Password",
                                    hintStyle: TextStyle(
                                      color: AppTheme.darkRed,
                                      fontFamily:
                                          AppTheme.macondoFont.fontFamily,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 40),
                              Container(
                                child: Center(
                                  child: ElevatedButton(
                                    child: const Text("Login"),
                                    style: AppTheme.buttonStyle,
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        if (passwordController.text ==
                                            confirmPassword.text) {
                                          final check = await context
                                              .read<AuthService>()
                                              .register(
                                                emailController.text.trim(),
                                                passwordController.text.trim(),
                                              );
                                          final snackBar = SnackBar(
                                            content: Text(check.toString()),
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                          if (check.toString() == "Signed Up") {
                                            AddUserInFirestore(
                                                nameController.text,
                                                emailController.text);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    //change page to the homepage
                                                    builder: (context) =>
                                                        Homepage()));
                                          }
                                        }
                                      }
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  fontFamily: AppTheme.macondoFont.fontFamily,
                                  color: AppTheme.darkRed,
                                  fontSize: 17),
                              text: "You already have an Account?",
                              children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => Login()));
                                  },
                                text: "Login",
                                style: TextStyle(
                                    fontFamily: AppTheme.macondoFont.fontFamily,
                                    decoration: TextDecoration.underline)),
                          ])),
                    ],
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
