import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scriba_app/defaults/theme.dart';
import 'package:scriba_app/screens/navscreens/homepage.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:async';

import 'package:scriba_app/services/translation_service.dart';

//import 'package:scriba_app/screens/translation.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _HomepageState();
}

var ipUrl = "http://164.92.180.13";

class _HomepageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'integration',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late XFile _imageFile;
  bool isLoading = false;
  bool check = false;
  bool imageSelected = false;

  final ImagePicker _picker = ImagePicker();

  var userID = FirebaseAuth.instance.currentUser?.uid;

  String output = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Back-dark.png"),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // first letters classification button
                Column(
                  children: [
                    Text(
                      "Characters",
                      style: TextStyle(
                        color: AppTheme.moderateOrange,
                        fontFamily: AppTheme.macondoFont.fontFamily,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        primary: AppTheme.darkRed,
                        side: const BorderSide(
                            color: AppTheme.moderateOrange, width: 4),
                      ),
                      child: Column(
                        children: [
                          Container(
                              width: 80,
                              height: 80,
                              alignment: Alignment.center,
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              child: Image.asset(
                                "assets/images/homepage_icons/char.png",
                                width: 50,
                              )),
                        ],
                      ),
                      onPressed: () async {
                        try {
                          final XFile? pickedFile = await _picker.pickImage(
                            source: ImageSource.gallery,
                          );
                          setState(() {
                            _imageFile = pickedFile!;
                            imageSelected = true;
                          });
                        } catch (e) {
                          print(e);
                        }
                        try {
                          isLoading = true;
                          check = true;
                          final bytes =
                              File(_imageFile!.path).readAsBytesSync();
                          String img64 = base64Encode(bytes);
                          final Dio _dio = Dio();
                          // print('sending image');
                          // print(img64);
                          _dio.post(
                            ipUrl,
                            data: {},
                            queryParameters: {"image": img64, "classid": 1},
                          ).then((value) async {
                            // display value wherever
                            print("value is ");
                            print(value);

                            setState(() {
                              output = value.toString();
                            });
                            if (output != "") {
                              // getTranslation(output);
                              // isLoading = false;
                              // check = false;
                              // DateTime currentPhoneDate =
                              //     DateTime.now(); //DateTime
                              // Timestamp myTimeStamp =
                              //     Timestamp.fromDate(currentPhoneDate);
                              // await addTranslationToFirebase(
                              //     output, myTimeStamp, userID!);
                              getTranslationScreen(output, userID!);
                            }
                            // print(output);
                            // if (value.data['status'] == "Image Opened") {
                            //   Fluttertoast.showToast(
                            //     msg: "Image Sent To Backend",
                            //     toastLength: Toast.LENGTH_SHORT,
                            //     gravity: ToastGravity.BOTTOM,
                            //     backgroundColor: Color.fromARGB(255, 175, 155, 76),
                            //     textColor: Colors.white,
                            //     fontSize: 16.0,
                            //   );
                            // }
                          });
                        } catch (e) {
                          print(e);
                        }
                      },
                    ),
                  ],
                ),

                // second (words) classification button
                Column(
                  children: [
                    Text(
                      "Words",
                      style: TextStyle(
                        color: AppTheme.moderateOrange,
                        fontFamily: AppTheme.macondoFont.fontFamily,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        primary: AppTheme.darkRed,
                        side: const BorderSide(
                            color: AppTheme.moderateOrange, width: 4),
                      ),
                      child: Container(
                          width: 80,
                          height: 80,
                          alignment: Alignment.center,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset(
                            "assets/images/homepage_icons/translate.png",
                            width: 70,
                          )),
                      onPressed: () async {
                        try {
                          final XFile? pickedFile = await _picker.pickImage(
                            source: ImageSource.gallery,
                          );
                          setState(() {
                            _imageFile = pickedFile!;
                            imageSelected = true;
                          });
                        } catch (e) {
                          print(e);
                        }
                        try {
                          isLoading = true;
                          check = true;
                          final bytes =
                              File(_imageFile!.path).readAsBytesSync();
                          String img64 = base64Encode(bytes);
                          final Dio _dio = Dio();
                          // print('sending image');
                          // print(img64);
                          _dio.post(
                            ipUrl,
                            data: {},
                            queryParameters: {"image": img64, "classid": 2},
                          ).then((value) {
                            // display value wherever
                            print("value is ");
                            print(value);

                            setState(() {
                              output = value.toString();
                            });

                            if (output != "") {
                              getTranslationScreen(output, userID!);
                            }

                            // print(output);
                            // if (value.data['status'] == "Image Opened") {
                            //   Fluttertoast.showToast(
                            //     msg: "Image Sent To Backend",
                            //     toastLength: Toast.LENGTH_SHORT,
                            //     gravity: ToastGravity.BOTTOM,
                            //     backgroundColor: Color.fromARGB(255, 175, 155, 76),
                            //     textColor: Colors.white,
                            //     fontSize: 16.0,
                            //   );
                            // }
                          });
                        } catch (e) {
                          print(e);
                        }
                      },
                    ),
                  ],
                ),

                //third (ROYALS) classification button
                Column(
                  children: [
                    Text(
                      "Royals",
                      style: TextStyle(
                        color: AppTheme.moderateOrange,
                        fontFamily: AppTheme.macondoFont.fontFamily,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        primary: AppTheme.darkRed,
                        side: const BorderSide(
                            color: AppTheme.moderateOrange, width: 4),
                      ),
                      child: Container(
                          width: 80,
                          height: 80,
                          alignment: Alignment.center,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset(
                            "assets/images/homepage_icons/royal.png",
                            width: 50,
                          )),
                      onPressed: () async {
                        try {
                          final XFile? pickedFile = await _picker.pickImage(
                            source: ImageSource.gallery,
                          );
                          setState(() {
                            _imageFile = pickedFile!;
                            imageSelected = true;
                          });
                        } catch (e) {
                          print(e);
                        }
                        try {
                          isLoading = true;
                          check = true;
                          final bytes =
                              File(_imageFile!.path).readAsBytesSync();
                          String img64 = base64Encode(bytes);
                          final Dio _dio = Dio();
                          // print('sending image');
                          // print(img64);
                          _dio.post(
                            ipUrl,
                            data: {},
                            queryParameters: {"image": img64, "classid": 3},
                          ).then((value) {
                            // display value wherever
                            print("value is ");
                            print(value);

                            setState(() {
                              output = value.toString();
                            });

                            if (output != "") {
                              getTranslationScreen(output, userID!);
                            }

                            // print(output);
                            // if (value.data['status'] == "Image Opened") {
                            //   Fluttertoast.showToast(
                            //     msg: "Image Sent To Backend",
                            //     toastLength: Toast.LENGTH_SHORT,
                            //     gravity: ToastGravity.BOTTOM,
                            //     backgroundColor: Color.fromARGB(255, 175, 155, 76),
                            //     textColor: Colors.white,
                            //     fontSize: 16.0,
                            //   );
                            // }
                          });
                        } catch (e) {
                          print(e);
                        }
                      },
                    )
                  ],
                ),
              ],
            ),
            // SizedBox(height: 10,),
            Center(
              child: imageSelected
                  ? SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.file(File(_imageFile!.path)))
                  : const Text(
                      '',
                      textAlign: TextAlign.center,
                    ),
            ),
            SizedBox(
              height: 5,
            ),
            // Text(output, style: TextStyle(fontSize: 15, backgroundColor: AppTheme.moderateOrange, color: Colors.white),),

            isLoading
                ? CircularProgressIndicator(
                    backgroundColor: AppTheme.moderateOrange,
                    color: AppTheme.darkRed,
                  )
                : Text(
                    output,
                    style: TextStyle(
                        fontSize: 30,
                        backgroundColor: AppTheme.darkRed,
                        color: AppTheme.moderateOrange),
                  ),
            SizedBox(
              height: 10,
            ),
            check
                ? Center(
                    child: Text(
                    "Wait for translation",
                    style: TextStyle(color: AppTheme.moderateOrange),
                  ))
                : SizedBox(
                    height: 10,
                  ),

            ElevatedButton(
              onPressed: () => speak(output),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Ink(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      AppTheme.moderateOrange,
                      AppTheme.gradientColor,
                      AppTheme.moderateOrange,
                    ]),
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  width: 120,
                  height: 40,
                  alignment: Alignment.center,
                  child: Text("Listen me",
                      style: TextStyle(
                          fontFamily: GoogleFonts.macondoSwashCaps().fontFamily,
                          fontSize: 20,
                          color: AppTheme.darkRed)),
                ),
              ),
            )
          ],
        ),
      ),

      // floatingActionButton: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: <Widget>[
      //     FloatingActionButton(  //open gallery
      //       onPressed: () async {
      //         try {
      //           final XFile? pickedFile = await _picker.pickImage(
      //             source: ImageSource.gallery,
      //           );
      //           setState(() {
      //             _imageFile = pickedFile;
      //             imageSelected = true;
      //           });
      //         } catch (e) {
      //           print(e);
      //         }
      //       },
      //       child: const Icon(Icons.photo),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.only(top: 16.0),
      //       child: FloatingActionButton( //send image to backend
      //         onPressed: () {
      //           try {
      //             final bytes = File(_imageFile!.path).readAsBytesSync();
      //             String img64 = base64Encode(bytes);
      //             final Dio _dio = Dio();
      //             // print('sending image');
      //             // print(img64);
      //             _dio.post(
      //               ipUrl,
      //               data:{},
      //               queryParameters: {"image":img64},
      //             ).then((value) {
      //              // display value wherever
      //               print("value is ");
      //               print(value);
      //               if (value.data['status'] == "Image Opened") {
      //                 Fluttertoast.showToast(
      //                   msg: "Image Sent To Backend",
      //                   toastLength: Toast.LENGTH_SHORT,
      //                   gravity: ToastGravity.BOTTOM,
      //                   backgroundColor: Color.fromARGB(255, 175, 155, 76),
      //                   textColor: Colors.white,
      //                   fontSize: 16.0,
      //                 );
      //               }
      //             });
      //           } catch (e) {
      //             print(e);
      //           }
      //         },
      //         child: const Icon(Icons.send),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  getTranslationScreen(String output, String userID) async {
    getTranslation(output);
    isLoading = false;
    check = false;
    DateTime currentPhoneDate = DateTime.now(); //DateTime
    Timestamp myTimeStamp = Timestamp.fromDate(currentPhoneDate);
    await addTranslationToFirebase(output, myTimeStamp, userID);
  }
}

final FlutterTts flutterTts = FlutterTts();
speak(word) async {
  //print(await flutterTts.getLanguages);
  await flutterTts.setLanguage("en-US");
  await flutterTts.setVolume(16);
  await flutterTts.speak(word);
}

//----------------------------------------------------------------------------------------------

// class _HomepageState extends State<MainPage> {
//   PickedFile? _image;
//   bool _loading = false;
//   List<dynamic>? _outputs;

//   void initState() {
//     super.initState();
//     _loading = true;

//     loadModel().then((value) {
//       setState(() {
//         _loading = false;
//       });
//     });
//   }

// //Load the Tflite model
//   loadModel() async {
//     print("loading model");
//     await Tflite.loadModel(
//       model: "assets/hieroglyphics.tflite",
//       labels: "assets/labels.txt",
//     );
//     print("sucessfull");
//   }

//   classifyImage(image) async {
//     var output = await Tflite.runModelOnImage(
//       path: image.path,
//       numResults: 10,
//       threshold: 0.5,
//       imageMean: 127.5,
//       imageStd: 127.5,
//     );
//     setState(() {
//       _loading = false;
//       //Declare List _outputs in the class which will be used to show the classified classs name and confidence
//       _outputs = output;
//     });
//   }

//   Future pickImage() async {
//     var image = await _picker.getImage(source: ImageSource.gallery);
//     if (image == null) return null;
//     setState(() {
//       _loading = true;
//       _image = image;
//     });
//     classifyImage(image);
//   }

//   final ImagePicker _picker = ImagePicker();
//   @override
//   Widget build(BuildContext context) => Scaffold(
//       body: Container(
//           constraints: const BoxConstraints.expand(),
//           decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage("assets/images/Back-dark.png"),
//                   fit: BoxFit.cover)),
//           child: _loading
//               ? Container(
//                   alignment: Alignment.center,
//                   child: CircularProgressIndicator(),
//                 )
//               : Container(
//                   width: MediaQuery.of(context).size.width,
//                   child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             shape: const CircleBorder(),
//                             primary: AppTheme.darkRed,
//                             side: BorderSide(
//                                 color: AppTheme.moderateOrange, width: 5),
//                           ),
//                           child: Column(
//                             children: [
//                               Container(
//                                 width: 40,
//                                 height: 40,
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: AppTheme.moderateOrange),
//                                 child: Icon(Icons.refresh,
//                                     color: AppTheme.darkRed),
//                               ),
//                             ],
//                           ),
//                           onPressed: () {
//                             Navigator.pushAndRemoveUntil(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => Homepage()),
//                               (Route<dynamic> route) => false,
//                             );
//                           },
//                         ),
//                         _image == null
//                             ? Container(
//                                 child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Column(
//                                     children: [
//                                       Text(
//                                         'Characters',
//                                         style: TextStyle(
//                                           fontFamily:
//                                               AppTheme.macondoFont.fontFamily,
//                                           fontSize: 20,
//                                           color: AppTheme.moderateOrange,
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 20,
//                                       ),
//                                       ElevatedButton(
//                                         style: ElevatedButton.styleFrom(
//                                           shape: const CircleBorder(),
//                                           primary: AppTheme.darkRed,
//                                           side: BorderSide(
//                                               color: AppTheme.moderateOrange,
//                                               width: 5),
//                                         ),
//                                         child: Column(
//                                           children: [
//                                             Container(
//                                                 width: 90,
//                                                 height: 90,
//                                                 alignment: Alignment.center,
//                                                 decoration: const BoxDecoration(
//                                                     shape: BoxShape.circle),
//                                                 child: Image.asset(
//                                                   "assets/images/homepage_icons/char.png",
//                                                   width: 50,
//                                                 )),
//                                           ],
//                                         ),
//                                         onPressed: _optiondialogbox,
//                                       ),
//                                     ],
//                                   ),
//                                   Column(
//                                     children: [
//                                       Text(
//                                         'Royals',
//                                         style: TextStyle(
//                                           fontFamily:
//                                               AppTheme.macondoFont.fontFamily,
//                                           fontSize: 20,
//                                           color: AppTheme.moderateOrange,
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 20,
//                                       ),
//                                       ElevatedButton(
//                                         style: ElevatedButton.styleFrom(
//                                           shape: const CircleBorder(),
//                                           primary: AppTheme.darkRed,
//                                           side: BorderSide(
//                                               color: AppTheme.moderateOrange,
//                                               width: 5),
//                                         ),
//                                         child: Container(
//                                             width: 90,
//                                             height: 90,
//                                             alignment: Alignment.center,
//                                             decoration: const BoxDecoration(
//                                                 shape: BoxShape.circle),
//                                             child: Image.asset(
//                                               "assets/images/homepage_icons/royal.png",
//                                               width: 50,
//                                             )),
//                                         onPressed: _optiondialogbox,
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ))
//                             : Image.file(File(_image!.path)),
//                         SizedBox(
//                           height: 50,
//                         ),
//                         _outputs != null
//                             ? Text(
//                                 '${_outputs![0]["label"]}',
//                                 style: TextStyle(
//                                   color: AppTheme.darkRed,
//                                   fontSize: 20.0,
//                                   background: Paint()..color = Colors.white,
//                                 ),
//                               )
//                             : Container()
//                       ]))));

//   Future openCamera() async {
//     var image = await _picker.getImage(source: ImageSource.camera);

//     setState(() {
//       _image = image;
//     });
//     classifyImage(image);
//   }

//   //camera method
//   Future openGallery() async {
//     var picture = await _picker.getImage(source: ImageSource.gallery);
//     setState(() {
//       _image = picture;
//     });
//     classifyImage(picture);
//   }

//   Future<void> _optiondialogbox() {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             backgroundColor: AppTheme.moderateOrange,
//             content: SingleChildScrollView(
//               child: ListBody(
//                 children: <Widget>[
//                   GestureDetector(
//                     child: Text(
//                       "Take a Picture",
//                       style: TextStyle(color: Colors.white, fontSize: 20.0),
//                     ),
//                     onTap: openCamera,
//                   ),
//                   Padding(padding: EdgeInsets.all(10.0)),
//                   GestureDetector(
//                     child: Text(
//                       "Select image ",
//                       style: TextStyle(color: Colors.white, fontSize: 20.0),
//                     ),
//                     onTap: openGallery,
//                   )
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }

//-----------------------------------------------------------------------------------------

// body: Container(
//     constraints: const BoxConstraints.expand(),
//     decoration: const BoxDecoration(
//         image: DecorationImage(
//             image: AssetImage("assets/images/Back-dark.png"),
//             fit: BoxFit.cover)),
//     child: _loading
//         ? Container(
//             alignment: Alignment.center,
//             child: CircularProgressIndicator(),
//           )
//         : Container(
//             child: ListView(children: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       shape: const CircleBorder(),
//                       primary: AppTheme.darkRed,
//                     ),
//                     child: Container(
//                         width: 100,
//                         height: 100,
//                         alignment: Alignment.center,
//                         decoration:
//                             const BoxDecoration(shape: BoxShape.circle),
//                         child: Image.asset(
//                           "assets/images/homepage_icons/Import.png",
//                           width: 70,
//                         )),
//                     onPressed: openGallery,
//                   ),
//                   SizedBox(
//                     width: 40,
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       shape: const CircleBorder(),
//                       primary: AppTheme.darkRed,
//                     ),
//                     child: Container(
//                       width: 100,
//                       height: 100,
//                       alignment: Alignment.center,
//                       decoration:
//                           const BoxDecoration(shape: BoxShape.circle),
//                       child: Icon(
//                         Icons.camera,
//                         color: AppTheme.moderateOrange,
//                         size: 50,
//                       ),
//                     ),
//                     onPressed: openCamera,
//                   )
//                 ],
//               ),
//             ]),
//           ))



    // body: Container(
      //     constraints: const BoxConstraints.expand(),
      //     decoration: const BoxDecoration(
      //         image: DecorationImage(
      //             image: AssetImage("assets/images/Back-dark.png"),
      //             fit: BoxFit.cover)),
      //     child: _loading
      //         ? Container(
      //             alignment: Alignment.center,
      //             child: CircularProgressIndicator(),
      //           )
      //         : Container(
      //             child: ListView(children: <Widget>[
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 children: [
      //                   ElevatedButton(
      //                     style: ElevatedButton.styleFrom(
      //                       shape: const CircleBorder(),
      //                       primary: AppTheme.darkRed,
      //                     ),
      //                     child: Container(
      //                         width: 100,
      //                         height: 100,
      //                         alignment: Alignment.center,
      //                         decoration:
      //                             const BoxDecoration(shape: BoxShape.circle),
      //                         child: Image.asset(
      //                           "assets/images/homepage_icons/Import.png",
      //                           width: 70,
      //                         )),
      //                     onPressed: openGallery,
      //                   ),
      //                   SizedBox(
      //                     width: 40,
      //                   ),
      //                   ElevatedButton(
      //                     style: ElevatedButton.styleFrom(
      //                       shape: const CircleBorder(),
      //                       primary: AppTheme.darkRed,
      //                     ),
      //                     child: Container(
      //                       width: 100,
      //                       height: 100,
      //                       alignment: Alignment.center,
      //                       decoration:
      //                           const BoxDecoration(shape: BoxShape.circle),
      //                       child: Icon(
      //                         Icons.camera,
      //                         color: AppTheme.moderateOrange,
      //                         size: 50,
      //                       ),
      //                     ),
      //                     onPressed: openCamera,
      //                   )
      //                 ],
      //               ),
      //             ]),
      //           ))

      