import 'dart:convert';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:my_muntazim/components/RoundedButton.dart';
import 'file:///I:/DTS/my_muntazim/lib/utils/constants.dart';
import 'package:my_muntazim/screens/navigation_menu.dart';
import 'package:my_muntazim/services/Constants.dart';
import 'package:my_muntazim/services/GetMethods.dart';
import 'package:my_muntazim/services/modelPasser.dart';
import 'file:///I:/DTS/my_muntazim/lib/services/models/parentAuthModel.dart';
import 'package:my_muntazim/utils/CustomToast.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'loginScreen';
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  var passwordController = TextEditingController();
  var usernameController = TextEditingController();

  // ParentAuthModel _parentAuth;
  // Map<String, dynamic> json1;
  //
  // int _responseCode;
  //
  // Future<ParentAuthModel> checkAuth(String username, String password) async {
  //   final String apiUrl =
  //       "http://mohidtest.dtssandbox.com/il/chicago/tmo/muntazim/api/parent/authenticate";
  //
  //   final response = await http
  //       .post(apiUrl, body: {"username": username, "password": password});
  //
  //   setState(() {
  //     _responseCode = response.statusCode;
  //   });
  //
  //   if (response.statusCode == 200) {
  //     final String responseString = response.body;
  //     json1 = json.decode(responseString);
  //     if (json1['status'] == 200) {
  //       return parentAuthModelFromJson(responseString);
  //     } else {
  //       return null;
  //     }
  //   } else {
  //     return null;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
                Flexible(
                  child: Hero(
                      tag: 'logo',
                      child: Container(
                        height: 150.0,
                        child:
                            Image.asset('assets/icon/Logo_Muntazim_Color.png'),
                      )),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  controller: usernameController,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  decoration:
                      KfiledDecorator.copyWith(hintText: "Enter your email"),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  controller: passwordController,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  obscureText: true,
                  decoration:
                      KfiledDecorator.copyWith(hintText: "Enter your pass"),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  title: "SIGN IN",
                  color: Color.fromRGBO(40, 105, 93, 10),
                  onPeressed: () async {
                    EasyLoading.instance
                      ..indicatorType = EasyLoadingIndicatorType.chasingDots
                      ..loadingStyle = EasyLoadingStyle.custom
                      ..maskType = EasyLoadingMaskType.custom
                      ..indicatorSize = 45.0
                      ..radius = 10.0
                      ..backgroundColor = Colors.white70
                      ..indicatorColor = Color.fromRGBO(1, 116, 111, 1)
                      ..progressColor = Color.fromRGBO(109, 171, 146, 50)
                      ..textColor = Colors.black
                      ..maskColor = Colors.black.withOpacity(0.5)
                      ..userInteractions = true;

                    EasyLoading.show(status: "Loading....");
                    final String username = usernameController.text;
                    final String password = passwordController.text;

                    bool result = await GetMethods.loginInit(
                        username: username, password: password);
                    EasyLoading.dismiss();

                    if (result) {
                      EasyLoading.showSuccess(Constants.loginModel.message);
                      //Navigator.pushNamed(context, NavigationMenu.id);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NavigationMenu(
                                    index: 0,
                                  )));
                    } else
                      CustomToast(text: Constants.loginModel.message);

                    // final ParentAuthModel parentAuth =
                    //     await checkAuth(username, password).whenComplete(() {
                    //   EasyLoading.dismiss();
                    // });
                    //
                    //
                    //
                    // setState(() {
                    //   // _parentAuth = parentAuth;
                    //   parentAuthChk = parentAuth;
                    // });
                    //
                    // if (parentAuthChk != null) {
                    //   Fluttertoast.showToast(
                    //       msg: parentAuthChk.message,
                    //       toastLength: Toast.LENGTH_SHORT);
                    //   EasyLoading.showSuccess(parentAuthChk.message);
                    //   Navigator.pushNamed(context, NavigationMenu.id);
                    // } else if (_responseCode > 200 || _responseCode < 200) {
                    //   Fluttertoast.showToast(
                    //       msg: "Error fetching data : ${_responseCode}",
                    //       toastLength: Toast.LENGTH_SHORT);
                    // } else {
                    //   Fluttertoast.showToast(
                    //       msg: json1['message'],
                    //       toastLength: Toast.LENGTH_SHORT);
                    // }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
