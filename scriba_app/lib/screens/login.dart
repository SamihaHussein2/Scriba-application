import 'package:flutter/material.dart';
import 'package:scriba_app/defaults/theme.dart';

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
        //width: double.infinity,
        // height: double.infinity,
        // decoration: BoxDecoration(
        //   color: AppTheme.darkRed,
        //   // borderRadius: BorderRadius.only(
        //   //     bottomLeft: Radius.circular(60),
        //   //     bottomRight: Radius.circular(60)),
        //   // image: DecorationImage(
        //   //   image: AssetImage("assets/images/logo.png"),
        //   // ),
        // ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //const SizedBox(height: 10),
            // #login, #welcome
            Padding(
              padding: const EdgeInsets.all(10),
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: AppTheme.darkRed,
                borderRadius: new BorderRadius.only(
                    bottomLeft: const Radius.circular(60.0),
                    bottomRight: const Radius.circular(60.0)),
                image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                ),
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
            const SizedBox(height: 20),

            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/Back-light.png"),
                      fit: BoxFit.cover),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        // #email, #password
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(171, 171, 171, .7),
                                  blurRadius: 20,
                                  offset: Offset(0, 10)),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade200)),
                                ),
                                child: const TextField(
                                  decoration: InputDecoration(
                                      hintText: "Email",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade200)),
                                ),
                                child: const TextField(
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        // #login
                        Container(
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppTheme.darkRed),
                          child: const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        // #login SNS

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
