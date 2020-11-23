import 'dart:ui';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_muntazim/services/Constants.dart';
import 'package:my_muntazim/services/modelPasser.dart';

class TranscriptScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TranscriptScreenState();
  }
}

class TranscriptScreenState extends State<TranscriptScreen> {
  bool showBottomMenu = false;
  bool isExpanded = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;

  Widget _mylistview2() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Wrap(
            children: <Widget>[
              ListTile(
                title: Wrap(
                  spacing: 120.0,
                  children: <Widget>[
                    Text("English ${index}"),
                    Text("10${index}"),
                    Text("1${index}"),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                height: 0,
                indent: 10.0,
                endIndent: 10.0,
              ),
            ],
          );
        });
  }

  Widget build(BuildContext context) {
    var Screenheight = MediaQuery.of(context).size.height;
    double threshold = 100;
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
                padding: EdgeInsets.only(left: ScreenWidth * 0.1),
                child: Text(
                  "TRANSCRIPT",
                  style: TextStyle(fontSize: 15.0, letterSpacing: 1.5),
                ),
              )),
            ),
            SliverFillRemaining(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(5, 115, 106, 30),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
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
                      trailing: Text(
                        "98.50%",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        "<Students name>",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 80.0),
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: 12.0,
                              right: 12.0,
                              top: Screenheight * 0.01),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(228, 229, 230, 10)),
                              child: ExpansionTile(
                                trailing: isExpanded
                                    ? Icon(Icons.keyboard_arrow_up)
                                    : Icon(Icons.keyboard_arrow_down),
                                onExpansionChanged: (bool ex) {
                                  setState(() {
                                    isExpanded = ex;
                                    if (isExpanded2 == true) {
                                      isExpanded2 = false;
                                    }
                                  });
                                },
                                title: isExpanded
                                    ? Text("MID TERM TEST")
                                    : Text("Mid Term Test"),
                                children: <Widget>[
                                  isExpanded
                                      ? Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              2,
                                          decoration: BoxDecoration(
                                              color: Colors.white),
                                          child: Column(
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 10.0,
                                                    left: 2.0,
                                                    bottom: 10.0),
                                                child: SizedBox(
                                                    //height: 30.0,
                                                    child: Wrap(
                                                  spacing:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          4.2,
                                                  children: <Widget>[
                                                    Text(
                                                      "Subject",
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          color: Color.fromRGBO(
                                                              138, 140, 143, 5),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "Max Marks",
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          color: Color.fromRGBO(
                                                              138, 140, 143, 5),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "Marks",
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          color: Color.fromRGBO(
                                                              138, 140, 143, 5),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                )),
                                              ),
                                              Divider(
                                                thickness: 2.0,
                                                height: 5,
                                                indent: 10.0,
                                                endIndent: 10.0,
                                              ),
                                              Flexible(
                                                child: SizedBox(
                                                  child: _mylistview2(),
                                                ),
                                              ),
                                              ListTile(),
                                            ],
                                          ),
                                        )
                                      : SizedBox(
                                          width: 1,
                                          height: 1,
                                        )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 12.0,
                              right: 12.0,
                              top: Screenheight * 0.01),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(228, 229, 230, 10)),
                              child: ExpansionTile(
                                trailing: isExpanded2
                                    ? Icon(Icons.keyboard_arrow_up)
                                    : Icon(Icons.keyboard_arrow_down),
                                onExpansionChanged: (bool ex) {
                                  setState(() {
                                    isExpanded2 = ex;
                                    if (isExpanded == true) {
                                      isExpanded = false;
                                    }
                                  });
                                },
                                title: isExpanded2
                                    ? Text("QUARTELY EXAM")
                                    : Text("Quartely Exam"),
                                children: <Widget>[
                                  isExpanded2
                                      ? Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              2,
                                          decoration: BoxDecoration(
                                              color: Colors.white),
                                          child: Column(
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 10.0,
                                                    left: 3.0,
                                                    bottom: 10.0),
                                                child: SizedBox(
                                                    //height: 30.0,
                                                    child: Wrap(
                                                  spacing:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          4.2,
                                                  children: <Widget>[
                                                    Text(
                                                      "Subject",
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          color: Color.fromRGBO(
                                                              138, 140, 143, 5),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "Max Marks",
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          color: Color.fromRGBO(
                                                              138, 140, 143, 5),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "Marks",
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          color: Color.fromRGBO(
                                                              138, 140, 143, 5),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                )),
                                              ),
                                              Divider(
                                                thickness: 2.0,
                                                height: 5,
                                                indent: 10.0,
                                                endIndent: 10.0,
                                              ),
                                              Flexible(
                                                child: SizedBox(
                                                  child: _mylistview2(),
                                                ),
                                              ),
                                              ListTile(),
                                            ],
                                          ),
                                        )
                                      : SizedBox(
                                          width: 1,
                                          height: 1,
                                        )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 12.0,
                              right: 12.0,
                              top: Screenheight * 0.012),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(228, 229, 230, 10)),
                              child: ExpansionTile(
                                trailing: isExpanded3
                                    ? Icon(Icons.keyboard_arrow_up)
                                    : Icon(Icons.keyboard_arrow_down),
                                onExpansionChanged: (bool ex) {
                                  setState(() {
                                    isExpanded3 = ex;
                                    if (isExpanded2 == true) {
                                      isExpanded2 = false;
                                    }
                                    if (isExpanded == true) {
                                      isExpanded = false;
                                    }
                                  });
                                },
                                title: isExpanded3
                                    ? Text("FINAL EXAM")
                                    : Text("Final Exam"),
                                children: <Widget>[
                                  isExpanded3
                                      ? Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              2,
                                          decoration: BoxDecoration(
                                              color: Colors.white),
                                          child: Column(
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 10.0,
                                                    left: 3.0,
                                                    bottom: 10.0),
                                                child: SizedBox(
                                                    //height: 30.0,
                                                    child: Wrap(
                                                  spacing:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          4.2,
                                                  children: <Widget>[
                                                    Text(
                                                      "Subject",
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          color: Color.fromRGBO(
                                                              138, 140, 143, 5),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "Max Marks",
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          color: Color.fromRGBO(
                                                              138, 140, 143, 5),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "Marks",
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          color: Color.fromRGBO(
                                                              138, 140, 143, 5),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                )),
                                              ),
                                              Divider(
                                                thickness: 2.0,
                                                height: 5,
                                                indent: 10.0,
                                                endIndent: 10.0,
                                              ),
                                              Flexible(
                                                child: SizedBox(
                                                  child: _mylistview2(),
                                                ),
                                              ),
                                              ListTile(),
                                            ],
                                          ),
                                        )
                                      : SizedBox(
                                          width: 1,
                                          height: 1,
                                        )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ])),
    ));
  }
}
