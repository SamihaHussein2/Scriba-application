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
import 'package:tflite/tflite.dart';
import 'dart:async';

import 'package:scriba_app/screens/translation.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _HomepageState();
}

class _HomepageState extends State<MainPage> {
 

PickedFile? _image;
  bool _loading =false; 
  List<dynamic>?_outputs;

  void initState() {
    super.initState();
    _loading = true;
    
    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
}


//Load the Tflite model
loadModel() async {
  print("loading model");
    await Tflite.loadModel(
      model: "assets/hieroglyphics.tflite",
      labels: "assets/labels.txt",
    );
    print("sucessfull");
}

classifyImage(image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 106,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _loading = false;
      //Declare List _outputs in the class which will be used to show the classified classs name and confidence
      _outputs = output;
    });
    
   
  }
  Future pickImage() async {
    var image = await _picker.getImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = image;
    });
    classifyImage(image);
  }


  final ImagePicker _picker = ImagePicker();

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Image Classification'),
        backgroundColor: Colors.purple,
        
      ),
      body: _loading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : Container(
                      
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _image == null ? Container() : Image.file(File(_image!.path)),
                    SizedBox(
                      height: 20,
                    ),
                    _outputs != null
                        ? Text('${_outputs![0]["label"]}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              background: Paint()..color = Colors.white,
                            ),
                          )
                        : Container()
                  ],
                ),
              ),
          
      floatingActionButton: FloatingActionButton(
        onPressed: _optiondialogbox,
        backgroundColor: Colors.purple,
        child: Icon(Icons.image),
      ),
    );
  }

  //camera method
  Future<void> _optiondialogbox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.purple,
            
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text(
                      "Take a Picture",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    onTap: openCamera,
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  GestureDetector(
                    child: Text(
                      "Select image ",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    onTap: openGallery,
                  )
                ],
              ),
            ),
          );
        });
  }

  Future openCamera() async {
    var image = await _picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = image ;
    });
  }

  //camera method
  Future openGallery() async {
    var picture = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = picture;
    }
     
    );
    classifyImage(picture);
     
  }


  // var ipUrl = "http://172.20.10.3:8003/image"; 

  // File? img;
  // Future ImportImage() async {
  //   try {
  //     final img = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (img == null) return;

  //     final PickedImage = File(img.path);
  //     setState(() => this.img = PickedImage);
  //   } on PlatformException catch (e) {
  //     print("Failed to pick image: $e");
  //   }
  // }

  // Future CaptureImage() async {
  //   try {
  //     final img = await ImagePicker().pickImage(source: ImageSource.camera);
  //     if (img == null) return;

  //     final TakenImage = File(img.path);
  //     setState(() => this.img = TakenImage);
  //   } on PlatformException catch (e) {
  //     print("Failed to pick image: $e");
  //   }
  // }

  // @override
  // Widget build(BuildContext context) => Scaffold(
  //     body: Container(
  //       constraints: const BoxConstraints.expand(),
  //       decoration: const BoxDecoration(
  //           image: DecorationImage(
  //               image: AssetImage("assets/images/Back-dark.png"),
  //               fit: BoxFit.cover)),
  //       child: ListView(children: <Widget>[
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             ElevatedButton(
  //               style: ElevatedButton.styleFrom(
  //                 shape: const CircleBorder(),
  //                 primary: AppTheme.darkRed,
  //               ),
  //               child: Container(
  //                   width: 100,
  //                   height: 100,
  //                   alignment: Alignment.center,
  //                   decoration: const BoxDecoration(shape: BoxShape.circle),
  //                   child: Image.asset(
  //                     "assets/images/homepage_icons/Import.png",
  //                     width: 70,
  //                   )),
  //               onPressed: () {
  //                 ImportImage();
  //               },
  //             ),
  //             SizedBox(
  //               width: 40,
  //             ),
  //             ElevatedButton(
  //               style: ElevatedButton.styleFrom(
  //                 shape: const CircleBorder(),
  //                 primary: AppTheme.darkRed,
  //               ),
  //               child: Container(
  //                 width: 100,
  //                 height: 100,
  //                 alignment: Alignment.center,
  //                 decoration: const BoxDecoration(shape: BoxShape.circle),
  //                 child: Icon(
  //                   Icons.camera,
  //                   color: AppTheme.moderateOrange,
  //                   size: 50,
  //                 ),
  //               ),
  //               onPressed: () {
  //                 CaptureImage();
  //               },
  //             )
  //           ],
  //         ),
  //         img == null
  //             ? Text(
  //                 'Please upload or capture an image',
  //               )
  //             : Image.file(img!),
  //       ]),
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       onPressed: () {
  //         try {
  //           final bytes = File(img!.path).readAsBytesSync();
  //           String img64 = base64Encode(bytes);
  //           print(img64);
  //           final Dio _dio = Dio();
  //           _dio.post(
  //             ipUrl,
  //             data: {"image": img64},
  //           ).then((value) {
  //             print(value.data['status']);
  //             if (value.data['status'] == "Image Opened") {
  //               Fluttertoast.showToast(
  //                 msg: "MSG sent to backend ",
  //                 toastLength: Toast.LENGTH_SHORT,
  //                 gravity: ToastGravity.BOTTOM,
  //                 backgroundColor: Colors.green,
  //                 textColor: Colors.white,
  //                 fontSize: 16.0,
  //               );
  //             }
  //           });
  //         } catch (e) {
  //           print(e);
  //         }
  //       },
  //       child: const Icon(Icons.send),
  //     ));
}
