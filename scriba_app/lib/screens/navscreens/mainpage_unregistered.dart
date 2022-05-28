import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scriba_app/screens/settings.dart';
import '/defaults/theme.dart';
import 'myth_page.dart';
import '/screens/navscreens/mainpage.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

class HomepageUnregistered extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
          body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Back-dark.png"),
                fit: BoxFit.fill)),
        child: navBarUnregistered(),
      ));
}

class navBarUnregistered extends StatefulWidget {
  navBarUnregistered({Key? key}) : super(key: key);

  @override
  State<navBarUnregistered> createState() => _navBarUnregisteredState();
}

int currentIndex = 0;
var _selectedTab = _SelectedTab.home;

class _navBarUnregisteredState extends State<navBarUnregistered> {
  List pages = [
    MainPage(),
    MythScreen(),
    Settings(),
  ];

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
      currentIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: pages[currentIndex],
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: DotNavigationBar(
          // enableFloatingNavBar: true,

          paddingR: EdgeInsets.all(10),

          //curve: Curves.slowMiddle,
          backgroundColor: AppTheme.darkRed,

          margin: EdgeInsets.only(left: 15, right: 15),
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),

          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              offset: Offset(0, 3),
              spreadRadius: 0,
            )
          ],
          dotIndicatorColor: AppTheme.moderateOrange,
          unselectedItemColor: Colors.grey,
          onTap: _handleIndexChanged,
          items: [
            DotNavigationBarItem(
                icon: Icon(Icons.home), selectedColor: AppTheme.moderateOrange),
            DotNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/homepage_icons/royal.png"),
                  size: 22,
                ),
                selectedColor: AppTheme.moderateOrange),
            DotNavigationBarItem(
                icon: Icon(Icons.settings),
                selectedColor: AppTheme.moderateOrange),
          ],
        ),
      ),
    );
  }
}

enum _SelectedTab { home, myth, settings }
