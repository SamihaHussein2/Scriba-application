import 'package:flutter/material.dart';

class NoInternetConn extends StatelessWidget {
  const NoInternetConn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("No Internet Connection, Check Your internet"),
          ],
        ),
      ),
    );
  }
}
