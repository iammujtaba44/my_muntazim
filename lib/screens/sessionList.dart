import 'dart:convert';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:my_muntazim/services/Constants.dart';
import 'package:my_muntazim/services/modelPasser.dart';
import 'package:my_muntazim/services/models/StudentsDataModel.dart';

class SessionScreen extends StatefulWidget {
  @override
  static String id = 'sessionScreen';
  var studentIndex;
  var schoolIndex;
  SessionScreen({this.schoolIndex, this.studentIndex});
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SessionScreenState();
  }
}

class SessionScreenState extends State<SessionScreen> {
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
        : ListView(
            children: [
              Container(
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                // padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2,
                        color: Color.fromRGBO(5, 115, 106,
                            70) //                   <--- border width here
                        )),
                child: Constants
                            .studentsDataModel
                            .data
                            .studentsInfo
                            .studentsList[widget.studentIndex]
                            .schoolsList[widget.schoolIndex]
                            .sessionsList
                            .previousAcademicSession !=
                        null
                    ? ExpansionTile(
                        tilePadding: EdgeInsets.only(right: 15, left: 15),
                        title: Text(
                          "Previous academic session",
                          style: TextStyle(
                              color: Color.fromRGBO(5, 115, 106, 10),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        children: <Widget>[
                          _getRow(
                              firstText: "Session Name",
                              secondText:
                                  "${Constants.studentsDataModel.data.studentsInfo.studentsList[widget.studentIndex].schoolsList[widget.schoolIndex].sessionsList.previousAcademicSession.sessionName}"),
                          _getDivider(),
                          _getRow(
                              firstText: "School Year",
                              secondText:
                                  "${Constants.studentsDataModel.data.studentsInfo.studentsList[widget.studentIndex].schoolsList[widget.schoolIndex].sessionsList.previousAcademicSession.schoolYear}"),
                          _getDivider(),
                          _getRow(
                              firstText: "Enrollment Exist",
                              secondText:
                                  "${Constants.studentsDataModel.data.studentsInfo.studentsList[widget.studentIndex].schoolsList[widget.schoolIndex].sessionsList.previousAcademicSession.enrollmentExist}"),
                          _getDivider(),
                          Padding(
                              padding: const EdgeInsets.only(
                                  right: 15.0, left: 15.0),
                              child: ExpansionTile(
                                tilePadding:
                                    EdgeInsets.only(right: 15, left: 15),
                                title: Text(
                                  "Grades",
                                  style: TextStyle(
                                      color: Color.fromRGBO(5, 115, 106, 10),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                children: List.generate(
                                    Constants
                                        .studentsDataModel
                                        .data
                                        .studentsInfo
                                        .studentsList[widget.studentIndex]
                                        .schoolsList[widget.schoolIndex]
                                        .sessionsList
                                        .previousAcademicSession
                                        .grades
                                        .length, (index) {
                                  return ExpansionTile(
                                    title: Text(
                                      "${Constants.studentsDataModel.data.studentsInfo.studentsList[widget.studentIndex].schoolsList[widget.schoolIndex].sessionsList.previousAcademicSession.grades[index].title}",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(5, 115, 106, 10),
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    children: [
                                      _getRow(
                                          firstText: "Roll number",
                                          secondText: Constants
                                              .studentsDataModel
                                              .data
                                              .studentsInfo
                                              .studentsList[widget.studentIndex]
                                              .schoolsList[widget.schoolIndex]
                                              .sessionsList
                                              .previousAcademicSession
                                              .grades[index]
                                              .rollNumber),
                                      _getDivider(),
                                      _getRow(
                                          firstText: "Enrollment status",
                                          secondText: Constants
                                                      .studentsDataModel
                                                      .data
                                                      .studentsInfo
                                                      .studentsList[
                                                          widget.studentIndex]
                                                      .schoolsList[
                                                          widget.schoolIndex]
                                                      .sessionsList
                                                      .previousAcademicSession
                                                      .grades[index]
                                                      .enrollmentStatus
                                                      .index ==
                                                  0
                                              ? "Enrolled"
                                              : "UnEnrolled"),
                                      _getDivider(),
                                      _getRow(
                                          firstText: "Application status",
                                          secondText: applicationStatusValues
                                              .map.keys
                                              .elementAt(Constants
                                                  .studentsDataModel
                                                  .data
                                                  .studentsInfo
                                                  .studentsList[
                                                      widget.studentIndex]
                                                  .schoolsList[
                                                      widget.schoolIndex]
                                                  .sessionsList
                                                  .previousAcademicSession
                                                  .grades[index]
                                                  .applicationStatus
                                                  .index)),
                                    ],
                                  );
                                }),
                              ))
                        ],
                      )
                    : ExpansionTile(
                        tilePadding: EdgeInsets.only(right: 15, left: 15),
                        title: Text(
                          "Previous academic session",
                          style: TextStyle(
                              color: Color.fromRGBO(5, 115, 106, 10),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                // padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2,
                        color: Color.fromRGBO(5, 115, 106,
                            70) //                   <--- border width here
                        )),
                child: Constants
                            .studentsDataModel
                            .data
                            .studentsInfo
                            .studentsList[widget.studentIndex]
                            .schoolsList[widget.schoolIndex]
                            .sessionsList
                            .currentAcademicSession !=
                        null
                    ? ExpansionTile(
                        tilePadding: EdgeInsets.only(right: 15, left: 15),
                        title: Text(
                          "Current academic session",
                          style: TextStyle(
                              color: Color.fromRGBO(5, 115, 106, 10),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        children: <Widget>[
                          _getRow(
                              firstText: "Session Name",
                              secondText:
                                  "${Constants.studentsDataModel.data.studentsInfo.studentsList[widget.studentIndex].schoolsList[widget.schoolIndex].sessionsList.currentAcademicSession.sessionName}"),
                          _getDivider(),
                          _getRow(
                              firstText: "School Year",
                              secondText:
                                  "${Constants.studentsDataModel.data.studentsInfo.studentsList[widget.studentIndex].schoolsList[widget.schoolIndex].sessionsList.currentAcademicSession.schoolYear}"),
                          _getDivider(),
                          _getRow(
                              firstText: "Enrollment Exist",
                              secondText:
                                  "${Constants.studentsDataModel.data.studentsInfo.studentsList[widget.studentIndex].schoolsList[widget.schoolIndex].sessionsList.currentAcademicSession.enrollmentExist}"),
                          _getDivider(),
                          Padding(
                              padding: const EdgeInsets.only(
                                  right: 15.0, left: 15.0),
                              child: ExpansionTile(
                                tilePadding:
                                    EdgeInsets.only(right: 15, left: 15),
                                title: Text(
                                  "Grades",
                                  style: TextStyle(
                                      color: Color.fromRGBO(5, 115, 106, 10),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                children: List.generate(
                                    Constants
                                        .studentsDataModel
                                        .data
                                        .studentsInfo
                                        .studentsList[widget.studentIndex]
                                        .schoolsList[widget.schoolIndex]
                                        .sessionsList
                                        .currentAcademicSession
                                        .grades
                                        .length, (index) {
                                  return ExpansionTile(
                                    title: Text(
                                      "${Constants.studentsDataModel.data.studentsInfo.studentsList[widget.studentIndex].schoolsList[widget.schoolIndex].sessionsList.currentAcademicSession.grades[index].title}",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(5, 115, 106, 10),
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    children: [
                                      _getRow(
                                          firstText: "Roll number",
                                          secondText: Constants
                                              .studentsDataModel
                                              .data
                                              .studentsInfo
                                              .studentsList[widget.studentIndex]
                                              .schoolsList[widget.schoolIndex]
                                              .sessionsList
                                              .currentAcademicSession
                                              .grades[index]
                                              .rollNumber),
                                      _getDivider(),
                                      _getRow(
                                          firstText: "Enrollment status",
                                          secondText: Constants
                                                      .studentsDataModel
                                                      .data
                                                      .studentsInfo
                                                      .studentsList[
                                                          widget.studentIndex]
                                                      .schoolsList[
                                                          widget.schoolIndex]
                                                      .sessionsList
                                                      .currentAcademicSession
                                                      .grades[index]
                                                      .enrollmentStatus
                                                      .index ==
                                                  0
                                              ? "Enrolled"
                                              : "UnEnrolled"),
                                      _getDivider(),
                                      _getRow(
                                          firstText: "Application status",
                                          secondText: applicationStatusValues
                                              .map.keys
                                              .elementAt(Constants
                                                  .studentsDataModel
                                                  .data
                                                  .studentsInfo
                                                  .studentsList[
                                                      widget.studentIndex]
                                                  .schoolsList[
                                                      widget.schoolIndex]
                                                  .sessionsList
                                                  .currentAcademicSession
                                                  .grades[index]
                                                  .applicationStatus
                                                  .index))
                                    ],
                                  );
                                }),
                              ))
                        ],
                      )
                    : ExpansionTile(
                        tilePadding: EdgeInsets.only(right: 15, left: 15),
                        title: Text(
                          "Current academic session",
                          style: TextStyle(
                              color: Color.fromRGBO(5, 115, 106, 10),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                // padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2,
                        color: Color.fromRGBO(5, 115, 106,
                            70) //                   <--- border width here
                        )),
                child: Constants
                            .studentsDataModel
                            .data
                            .studentsInfo
                            .studentsList[widget.studentIndex]
                            .schoolsList[widget.schoolIndex]
                            .sessionsList
                            .nextAcademicSession !=
                        null
                    ? ExpansionTile(
                        tilePadding: EdgeInsets.only(right: 15, left: 15),
                        title: Text(
                          "Next academic session",
                          style: TextStyle(
                              color: Color.fromRGBO(5, 115, 106, 10),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        children: <Widget>[
                          _getRow(
                              firstText: "Session Name",
                              secondText:
                                  "${Constants.studentsDataModel.data.studentsInfo.studentsList[widget.studentIndex].schoolsList[widget.schoolIndex].sessionsList.nextAcademicSession.sessionName}"),
                          _getDivider(),
                          _getRow(
                              firstText: "School Year",
                              secondText:
                                  "${Constants.studentsDataModel.data.studentsInfo.studentsList[widget.studentIndex].schoolsList[widget.schoolIndex].sessionsList.nextAcademicSession.schoolYear}"),
                          _getDivider(),
                          _getRow(
                              firstText: "Enrollment Exist",
                              secondText:
                                  "${Constants.studentsDataModel.data.studentsInfo.studentsList[widget.studentIndex].schoolsList[widget.schoolIndex].sessionsList.nextAcademicSession.enrollmentExist}"),
                          _getDivider(),
                          Padding(
                              padding: const EdgeInsets.only(
                                  right: 15.0, left: 15.0),
                              child: ExpansionTile(
                                tilePadding:
                                    EdgeInsets.only(right: 15, left: 15),
                                title: Text(
                                  "Grades",
                                  style: TextStyle(
                                      color: Color.fromRGBO(5, 115, 106, 10),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                children: List.generate(
                                    Constants
                                        .studentsDataModel
                                        .data
                                        .studentsInfo
                                        .studentsList[widget.studentIndex]
                                        .schoolsList[widget.schoolIndex]
                                        .sessionsList
                                        .nextAcademicSession
                                        .grades
                                        .length, (index) {
                                  return ExpansionTile(
                                    title: Text(
                                      "${Constants.studentsDataModel.data.studentsInfo.studentsList[widget.studentIndex].schoolsList[widget.schoolIndex].sessionsList.nextAcademicSession.grades[index].title}",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(5, 115, 106, 10),
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    children: [
                                      _getRow(
                                          firstText: "Roll number",
                                          secondText: Constants
                                              .studentsDataModel
                                              .data
                                              .studentsInfo
                                              .studentsList[widget.studentIndex]
                                              .schoolsList[widget.schoolIndex]
                                              .sessionsList
                                              .nextAcademicSession
                                              .grades[index]
                                              .rollNumber),
                                      _getDivider(),
                                      _getRow(
                                          firstText: "Enrollment status",
                                          secondText: Constants
                                                      .studentsDataModel
                                                      .data
                                                      .studentsInfo
                                                      .studentsList[
                                                          widget.studentIndex]
                                                      .schoolsList[
                                                          widget.schoolIndex]
                                                      .sessionsList
                                                      .nextAcademicSession
                                                      .grades[index]
                                                      .enrollmentStatus
                                                      .index ==
                                                  0
                                              ? "Enrolled"
                                              : "UnEnrolled"),
                                      _getDivider(),
                                      _getRow(
                                          firstText: "Application status",
                                          secondText: applicationStatusValues
                                              .map.keys
                                              .elementAt(Constants
                                                  .studentsDataModel
                                                  .data
                                                  .studentsInfo
                                                  .studentsList[
                                                      widget.studentIndex]
                                                  .schoolsList[
                                                      widget.schoolIndex]
                                                  .sessionsList
                                                  .nextAcademicSession
                                                  .grades[index]
                                                  .applicationStatus
                                                  .index))
                                    ],
                                  );
                                }),
                              ))
                        ],
                      )
                    : ExpansionTile(
                        tilePadding: EdgeInsets.only(right: 15, left: 15),
                        title: Text(
                          "Next academic session",
                          style: TextStyle(
                              color: Color.fromRGBO(5, 115, 106, 10),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
              ),
            ],
          );
  }

  Padding _getRow({String firstText, String secondText}) {
    return Padding(
        padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              firstText,
              style: TextStyle(
                color: Color.fromRGBO(5, 115, 106, 10),
                fontSize: 15.0,
              ),
            ),
            Text(
              secondText,
              style: TextStyle(
                color: Color.fromRGBO(5, 115, 106, 10),
                fontSize: 15.0,
              ),
            )
          ],
        ));
  }

  Padding _getDivider() {
    return Padding(
        padding: const EdgeInsets.only(
            right: 25.0, left: 25.0, top: 5.0, bottom: 5.0),
        child: Divider(
          thickness: 1.5,
        ));
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
