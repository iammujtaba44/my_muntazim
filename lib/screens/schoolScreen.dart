import 'dart:convert';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:my_muntazim/screens/sessionList.dart';
import 'package:my_muntazim/services/Constants.dart';
import 'package:my_muntazim/services/modelPasser.dart';
import 'file:///I:/DTS/my_muntazim/lib/services/models/studentModel.dart';

class SchoolScreen extends StatefulWidget {
  @override
  static String id = 'schoolScreen';
  int Stdi;
  SchoolScreen(this.Stdi);
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SchoolScreenState();
  }
}

class SchoolScreenState extends State<SchoolScreen> {
  bool showBottomMenu = false;
  final notifications = [
    'Noman',
    'Raheel',
    'Mujtaba',
    'Hassan',
    'railway',
    'run',
    'subway',
    'transit',
    'walk',
    'talk'
  ];

  void initState() {
    // getter();
    super.initState();
  }

  Widget _mylistview() {
    return Constants.studentsDataModel == null
        ? Center(
            child: SpinKitChasingDots(
              size: 50.0,
              color: Color.fromRGBO(1, 116, 111, 10),
            ),
          )
        : ListView.builder(
            itemCount: Constants
                .studentsDataModel
                .data
                .studentsInfo
                .studentsList[widget.Stdi]
                .schoolsList
                .length, //studentModel.data.studentsInfo.studentsList.length,
            itemBuilder: (context, index) {
              return Container(
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                // padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2,
                        color: Color.fromRGBO(228, 229, 230,
                            10) //                   <--- border width here
                        )), //       <--- BoxDecoration here
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25.0,
                    backgroundColor: Color.fromRGBO(5, 115, 106, 70),
                    child: CircleAvatar(
                      radius: 23.0,
                      backgroundColor: Color.fromRGBO(228, 229, 230, 10),
                      child: IconButton(
                        icon: Icon(
                          Icons.school_outlined,
                          size: 32.0,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    Constants
                        .studentsDataModel
                        .data
                        .studentsInfo
                        .studentsList[widget.Stdi]
                        .schoolsList[index]
                        .schoolName,
                    // studentModel.data.studentsInfo.studentsList[widget.Stdi]
                    //   .schoolsList[index].schoolName,
                    style: TextStyle(
                        color: Color.fromRGBO(5, 115, 106, 10),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SessionScreen(
                                  schoolIndex: index,
                                  studentIndex: widget.Stdi,
                                )));
                    // Fluttertoast.showToast(
                    //     msg: "Student ${index} tapped",
                    //     toastLength: Toast.LENGTH_SHORT);
                  },
                ),
              );
            },
          );
  }

  Widget build(BuildContext context) {
    var Screenheight = MediaQuery.of(context).size.height;
    var ScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: ColorfulSafeArea(
      color: Color.fromRGBO(108, 171, 145, 10),
      minimum: EdgeInsets.only(top: 42.0),
      child: Container(
          height: Screenheight,
          decoration: BoxDecoration(color: Color.fromRGBO(228, 229, 230, 100)),
          child: CustomScrollView(slivers: <Widget>[
            SliverAppBar(
              title: Column(
                children: <Widget>[
                  Text(
                    "Welcome to",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      //fontSize: 15.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(Constants.loginModel.data.displayAs,
                      style: TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 20.0))
                ],
              ),
              titleSpacing: 0.5,
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 5.0),
                  child: CircleAvatar(
                    backgroundColor: Color.fromRGBO(5, 115, 106, 10),
                    radius: 23,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: Icon(
                          Icons.person,
                          color: Color.fromRGBO(5, 115, 106, 10),
                        ),
                      ),
                    ),
                  ),
                )
              ],
              floating: true,
              pinned: true,
              backgroundColor: Color.fromRGBO(108, 171, 145, 10),
              expandedHeight: 100.0,
              flexibleSpace: FlexibleSpaceBar(
                  title: Padding(
                padding: EdgeInsets.only(
                    left: ScreenWidth =
                        MediaQuery.of(context).size.width * 0.1),
                child: Text(
                  "Schools",
                  style: TextStyle(fontSize: 15.0, letterSpacing: 1.5),
                ),
              )),
            ),
            SliverFillRemaining(
              child: Stack(
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      width: MediaQuery.of(context).size.width,
                      height: Screenheight / 1.3,
                      child: _mylistview()),
                ],
              ),
            )
          ])),
    ));
  }
}
