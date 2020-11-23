import 'dart:async';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_muntazim/screens/signIn_Screen.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'splashScreen';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5),
        () => Navigator.pushNamed(context, SignInScreen.id));
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ColorfulSafeArea(
        color: Color.fromRGBO(108, 171, 145, 10),
        minimum: EdgeInsets.only(top: 42.0),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration:
                  BoxDecoration(color: Color.fromRGBO(109, 171, 146, 5)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        AvatarGlow(
                          endRadius: 150,
                          duration: Duration(seconds: 2),
                          glowColor:
                              Color.fromRGBO(1, 116, 111, 0), //Colors.white24,
                          repeat: true,
                          showTwoGlows: true,
                          repeatPauseDuration: Duration(microseconds: 2),
                          // startDelay: Duration(seconds: 1),
                          child: Material(
                              elevation: 8.0,
                              shape: CircleBorder(),
                              child: CircleAvatar(
                                backgroundColor:
                                    Color.fromRGBO(109, 171, 146, 50),
                                child: Image.asset(
                                  'assets/icon/Logo_Muntazim_Color.png',
                                  height: 60,
                                ),
                                radius: 100.0,
                              )),
                        ),
                        Container(
                            child: Image.asset(
                                'assets/icon/Logo_Muntazim_Color.png'),
                            height: 150.0 //_animation2.value * 100 //60.0,
                            ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SpinKitChasingDots(
                        color: Color.fromRGBO(1, 116, 111, 10),
                        size: 70,
                      ),
                      //    CircularProgressIndicator(
                      //      backgroundColor: Color.fromRGBO(109, 171, 146, 10),
                      //      valueColor: AlwaysStoppedAnimation<Color>(
                      //         Color.fromRGBO(1, 116, 111, 10)),
                      //  ),
                      Padding(padding: EdgeInsets.only(top: 20.0)),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
