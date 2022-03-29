import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scriba_app/defaults/theme.dart';
import 'package:scriba_app/screens/navscreens/homepage.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scriba_app/screens/translation.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _HomepageState();
}

class _HomepageState extends State<MainPage> {
  var ipUrl = "http://192.168.211.1:8003/image";

  File? img;
  Future ImportImage() async {
    try {
      final img = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (img == null) return;

      final PickedImage = File(img.path);
      setState(() => this.img = PickedImage);
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  Future CaptureImage() async {
    try {
      final img = await ImagePicker().pickImage(source: ImageSource.camera);
      if (img == null) return;

      final TakenImage = File(img.path);
      setState(() => this.img = TakenImage);
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Back-dark.png"),
                fit: BoxFit.cover)),
        child: ListView(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  primary: AppTheme.darkRed,
                ),
                child: Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(
                      "assets/images/homepage_icons/Import.png",
                      width: 70,
                    )),
                onPressed: () {
                  ImportImage();
                },
              ),
              SizedBox(
                width: 40,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  primary: AppTheme.darkRed,
                ),
                child: Container(
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Icon(
                    Icons.camera,
                    color: AppTheme.moderateOrange,
                    size: 50,
                  ),
                ),
                onPressed: () {
                  CaptureImage();
                },
              )
            ],
          ),
          img == null
              ? Text(
                  'Please upload or capture an image',
                )
              : Image.file(img!),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.darkRed,
        foregroundColor: AppTheme.moderateOrange,
        onPressed: () {
          try {
            final bytes = File(img!.path).readAsBytesSync();
            String img64 = base64Encode(bytes);
            final Dio _dio = Dio();
            _dio.post(
              ipUrl,
              data: {"image": img64},
            ).then((value) {
              print(value.data['status']);
              if (value.data['status'] == "Image Opened") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => TranslationScreen()),
                );
                Fluttertoast.showToast(
                  msg: "This is King ",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              }
            });
          } catch (e) {
            print(e);
          }
        },
        child: const Icon(Icons.send),
      ));
}
