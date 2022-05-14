import 'package:flutter/material.dart';
import '/defaults/theme.dart';

import '/defaults/config.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text("Saved Translations",
                style: TextStyle(
                  fontFamily: AppTheme.macondoFont.fontFamily,
                  color: AppTheme.moderateOrange,
                ))),
        body: Container(
            // constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Back-dark.png"),
                    fit: BoxFit.cover)),
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 200,
                  child: Card(
                      color: Colors.transparent,
                      child: ListTile(
                        subtitle: Text(
                          "Lorem ipsum dolor sit amet.",
                          style: TextStyle(
                            color: AppTheme.moderateOrange,
                            fontFamily: AppTheme.macondoFont.fontFamily,
                            fontSize: 18,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.more_horiz,
                              color: AppTheme.moderateOrange),
                          tooltip: "Lorem ipsum dolor sit amet.",
                          disabledColor: Colors.white,
                          onPressed: () {},
                        ),
                      ),
                      margin: EdgeInsets.only(
                          top: 100, left: 20, right: 20, bottom: 0),
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: AppTheme.moderateOrange))),
                ),
                SizedBox(
                  height: 170,
                  child: Card(
                    color: Colors.transparent,
                    child: ListTile(
                      subtitle: Text(
                        "Lorem ipsum dolor sit amet.",
                        style: TextStyle(
                          color: AppTheme.moderateOrange,
                          fontFamily: AppTheme.macondoFont.fontFamily,
                          fontSize: 18,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_horiz),
                        color: AppTheme.moderateOrange,
                      ),
                    ),
                    margin: EdgeInsets.only(
                        top: 40, left: 20, right: 20, bottom: 20),
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppTheme.moderateOrange)),
                  ),
                ),
                SizedBox(
                  height: 170,
                  child: Card(
                    color: Colors.transparent,
                    child: ListTile(
                      subtitle: Text(
                        "Lorem ipsum dolor sit amet.",
                        style: TextStyle(
                          color: AppTheme.moderateOrange,
                          fontFamily: AppTheme.macondoFont.fontFamily,
                          fontSize: 18,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_horiz),
                        color: AppTheme.moderateOrange,
                      ),
                    ),
                    margin: EdgeInsets.only(
                        top: 40, left: 20, right: 20, bottom: 20),
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppTheme.moderateOrange)),
                  ),
                ),
              ],
            )));
  }
}
