import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_muntazim/screens/assignments_screen.dart';
import 'package:my_muntazim/screens/communication_screen.dart';
import 'package:my_muntazim/screens/home_screen.dart';
import 'package:my_muntazim/screens/notification_screen.dart';
import 'package:my_muntazim/screens/studentScreen.dart';
import 'package:my_muntazim/screens/transcript_screen.dart';

class NavigationMenu extends StatefulWidget {
  static String id = 'navigationMenu';

  final int index;
  NavigationMenu({this.index});

  // NavigationMenu({this._index});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NavigationMenuState(currentIndex: index);
  }
}

class NavigationMenuState extends State<NavigationMenu> {
  int currentIndex;

  NavigationMenuState({this.currentIndex});
  final tabs = [
    Home(),
    StudentsScreen(),
    AssignmentScreen(),
    CommunicationScreen(),
    NotificationScreen(),
    AssignmentScreen(),
    TranscriptScreen()
  ];

  Widget _showPage = Home();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        // return home;
        return tabs[page];
        break;
      case 1:
        return tabs[page];
        break;
      case 2:
        return tabs[page];
        break;
      case 3:
        return tabs[page];
        break;
      case 4:
        return tabs[page];
        break;
      case 5:
        return tabs[page];
        break;
      case 6:
        return tabs[page];
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Color iconColor = Color.fromRGBO(108, 171, 145, 10);
    return Scaffold(
      //  body: LoginScreen(),
      bottomNavigationBar: CurvedNavigationBar(
        index: currentIndex < 5 ? currentIndex : 0,

        color: Colors.white,
        backgroundColor: Color.fromRGBO(228, 229, 230, 100),
        buttonBackgroundColor: Colors.white,
        height: 50,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 20,
            color: iconColor,
          ),
          Icon(
            Icons.person,
            size: 20,
            color: iconColor,
          ),
          Icon(
            Icons.payment,
            size: 20,
            color: iconColor,
          ),
          Icon(
            MdiIcons.chatProcessing,
            size: 20,
            color: iconColor,
          ),
          Icon(
            Icons.notifications,
            size: 20,
            color: iconColor,
          ),
        ],

        //Where to start
        //index: 2,
        animationDuration: Duration(microseconds: 200),
        animationCurve: Curves.bounceInOut,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            _showPage = _pageChooser(index);
          });
          Fluttertoast.showToast(
              msg: index.toString(), toastLength: Toast.LENGTH_SHORT);
        },
      ),

      body: Container(
        child: pageShow(currentIndex),
      ),
    );
  }

  Widget pageShow(int indexx) {
    setState(() {
      //print(widget.index.toString());
      //print(currentIndex.toString());
      _showPage = _pageChooser(indexx);
    });
    return _showPage;
  }
}
