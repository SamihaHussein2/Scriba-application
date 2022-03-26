import 'package:flutter/material.dart';
import '/defaults/theme.dart';

import '../defaults/config.dart';

class TranslationScreen extends StatelessWidget {
  const TranslationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: Container(
            // constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Back-dark.png"),
                    fit: BoxFit.cover)),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 300,
                  child: Card(
                      color: Colors.transparent,
                      child: ListTile(
                        title: Text(
                          "Translation\n",
                          style: TextStyle(
                            color: AppTheme.moderateOrange,
                            fontFamily: AppTheme.macondoFont.fontFamily,
                            fontSize: 25,
                          ),
                        ),
                        subtitle: Text(
                          "Lorem ipsum dolor sit amet. Aut molestiae consequuntur et praesentium quibusdam ad quis veritatis est dolorum.",
                          style: TextStyle(
                            color: AppTheme.moderateOrange,
                            fontFamily: AppTheme.macondoFont.fontFamily,
                            fontSize: 18,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.translate,
                              color: AppTheme.moderateOrange),
                          tooltip: "Translate to Arabic",
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
                // ElevatedButton.icon(
                //     onPressed: () {},
                //     icon: Icon(Icons.translate),
                //     label: Text('Translate to Arabic')),
                SizedBox(
                  height: 170,
                  child: Card(
                    color: Colors.transparent,
                    child: ListTile(
                      title: Text(
                        "Myth\n",
                        style: TextStyle(
                          color: AppTheme.moderateOrange,
                          fontFamily: AppTheme.macondoFont.fontFamily,
                          fontSize: 25,
                        ),
                      ),
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

                ElevatedButton.icon(
                    style: AppTheme.buttonStyle,
                    onPressed: () {},
                    icon: Icon(Icons.save),
                    label: Text(
                      'Save Translation',
                    )),
              ],
            )));
  }
}
