import 'dart:convert';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:my_muntazim/screens/schoolScreen.dart';
import 'package:my_muntazim/services/Constants.dart';
import 'package:my_muntazim/services/GetMethods.dart';
import 'package:my_muntazim/services/modelPasser.dart';


class StudentsScreen extends StatefulWidget {
  @override
  static String id = 'communicationScreen';
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StudentsScreenState();
  }
}

class StudentsScreenState extends State<StudentsScreen> {
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

  var _getStatus;
  int _statusCode;

  // Future<StudentModel> getStudentList(String parentID) async {
  //   final String apiUrl =
  //       "http://mohidtest.dtssandbox.com/il/chicago/tmo/muntazim/api/parent/students/${parentID}";
  //
  //   final response = await http
  //       .get(apiUrl, headers: {'access-token': parentAuthChk.data.accessToken});
  //
  //   _statusCode = response.statusCode;
  //   if (response.statusCode == 200) {
  //     final String responseString = response.body;
  //     _getStatus = json.decode(responseString);
  //     if (_getStatus['message'] == "success" || _getStatus['status'] == 200) {
  //       return studentModelFromJson(responseString);
  //     } else {
  //       return null;
  //     }
  //   } else {
  //     return null;
  //   }
  // }

  // getter() {
  //   getStudentList(parentAuthChk.data.parentId).then((value) {
  //     setState(() {
  //       studentModel = value;
  //
  //       print(studentModel.message);
  //     });
  //   });
  // }

  bool hasData = false;
  getData() async {
    bool results = await GetMethods.studentsInit(
        parentId: Constants.loginModel.data.parentId);

    if (results) {
      if (mounted)
        setState(() {
          hasData = true;
        });
    } else {
      if (mounted)
        setState(() {
          hasData = false;
        });
    }

    print(Constants.studentsDataModel.message);
  }

  void initState() {
    //getter();
    getData();
    super.initState();
  }

  Widget _mylistview() {
    return !hasData
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
                .studentsList
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
                          Icons.person_outline,
                          size: 32.0,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    Constants.studentsDataModel.data.studentsInfo
                        .studentsList[index].studentName,
                    // studentModel
                    //   .data.studentsInfo.studentsList[index].studentName,
                    style: TextStyle(
                        color: Color.fromRGBO(5, 115, 106, 10),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SchoolScreen(index)));
                    //   Fluttertoast.showToast(
                    //      msg: "Student ${index} tapped",
                    //      toastLength: Toast.LENGTH_SHORT);
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
                  "STUDENTS",
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
