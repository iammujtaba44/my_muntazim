import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_muntazim/components/RoundedButton.dart';
import 'package:my_muntazim/screens/login_screen.dart';

class SignInScreen extends StatefulWidget {
  static String id = 'signInScreen';
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(109, 171, 146, 100),
      body: ColorfulSafeArea(
        color: Color.fromRGBO(108, 171, 145, 10),
        minimum: EdgeInsets.only(top: 42.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(109, 171, 146, 5)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                    tag: 'logo',
                    child: Container(
                        child:
                            Image.asset('assets/icon/Logo_Muntazim_Color.png'),
                        height: 150.0 //_animation2.value * 100 //60.0,
                        )),
                SizedBox(
                  height: 48.0,
                ),
                RoundedButton(
                    onPeressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));

                      // Fluttertoast.showToast(
                      //     msg: "Sign in Pressed",
                      //     toastLength: Toast.LENGTH_SHORT);
                      // Navigator.pushNamed(context, LoginScreen.id);
                    },
                    title: "SIGN IN",
                    color: Color.fromRGBO(1, 116, 111, 10)),
                RoundedButton(
                    onPeressed: () {
                      Fluttertoast.showToast(
                          msg: "Sign up Pressed",
                          toastLength: Toast.LENGTH_SHORT);
                    },
                    title: "SIGN UP",
                    color: Color.fromRGBO(109, 171, 146, 10)
                    // color: Colors.fromRGBO(117, 165, 93, 100),

                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
