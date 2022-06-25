import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scriba_app/screens/single_translation_page.dart';
import 'package:scriba_app/services/user_service.dart';
import 'package:scriba_app/widgets/app_cards.dart';
import 'package:scriba_app/widgets/history_card.dart';
import '/defaults/theme.dart';

import '/defaults/config.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    String ex = "f4P03DUgmQh3w9ZiAfBf";
    final trans = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection("Translations");
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Translation History",
              style: TextStyle(
                  color: AppTheme.moderateOrange,
                  fontSize: 25,
                  fontFamily: GoogleFonts.macondoSwashCaps().fontFamily)),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/Back-dark.png"),
                  fit: BoxFit.cover)),
          padding: const EdgeInsets.only(top: 90),
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            // inside the <> you enter the type of your stream
            stream: trans.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return HistoryCard(
                      title: "",
                      subtitle: snapshot.data!.docs[index].get('english'),
                      dest: TranslationScreen(),
                    );
                  },
                );
              }
              if (snapshot.hasError) {
                return const Text('Error');
              }
              // return const CircularProgressIndicator();
              return const Center(
                child: Text(
                  "No History",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppTheme.moderateOrange,
                  ),
                ),
              );
            },
          ),
          // FutureBuilder<DocumentSnapshot>(
          //   future: trans.doc(ex).get(),
          //   builder: (BuildContext context,
          //       AsyncSnapshot<DocumentSnapshot> snapshot) {
          //     if (snapshot.hasError) {
          //       return Text("Something went wrong");
          //     }

          //     if (snapshot.hasData && !snapshot.data!.exists) {
          //       return Text("Document does not exist");
          //     }

          //     if (snapshot.connectionState == ConnectionState.done) {
          //       Map<String, dynamic> data =
          //           snapshot.data!.data() as Map<String, dynamic>;
          //       return AppCard(
          //         title: "",
          //         subtitle: "${data['english']}",
          //         dest: TranslationScreen(),
          //       );
          //     }
          //     return Text("loading");
          //   },
          // ),
          // AppCard(
          //   title: "",
          //   subtitle: "Lorem ipsum dolor sit amet.",
          //   dest: TranslationScreen(),
          // ),
          // AppCard(
          //   title: "",
          //   subtitle: "Lorem ipsum dolor sit amet.",
          //   dest: TranslationScreen(),
          // ),
          // AppCard(
          //   title: "",
          //   subtitle: "Lorem ipsum dolor sit amet.",
          //   dest: TranslationScreen(),
          // ),
        ));
  }
}
