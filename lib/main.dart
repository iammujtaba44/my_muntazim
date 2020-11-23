import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_muntazim/login_screen1.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  Widget build(BuildContext context) {
    return FlutterEasyLoading(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "MUNTAZIM",
          home: LoginScreen1(
            key: key,
            primaryColor: Colors.blue,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('assets/icon/Logo_Muntazim_Color.png'),
          )

          //SignInScreen(),

          ),
    );
  }
}
