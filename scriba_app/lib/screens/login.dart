import 'package:flutter/material.dart';
import 'package:scriba_app/defaults/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../defaults/config.dart';

class Login extends StatefulWidget {
  static const String id = 'mentor sample 1';

  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                // decoration: const BoxDecoration(
                //   image: DecorationImage(
                //       image: AssetImage("assets/images/Back-light.png"),
                //       fit: BoxFit.cover),
                // ),
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
                                child: const TextField(
                                  decoration: InputDecoration(
                                      hintText: "Email",
                                      hintStyle: TextStyle(
                                        color: AppTheme.darkRed,
                                      ),
                                      border: InputBorder.none),
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
                                child: const TextField(
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle:
                                          TextStyle(color: AppTheme.darkRed),
                                      border: InputBorder.none),
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
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => Login()),
                                );
                              },
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.blue),
                                child: const Center(
                                  child: Text(
                                    "Facebook",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 30),
                            Expanded(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.black),
                                child: const Center(
                                  child: Text(
                                    "Github",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
