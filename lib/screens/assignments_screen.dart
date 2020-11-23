import 'dart:ui';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_muntazim/services/modelPasser.dart';

class AssignmentScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AssignmentScreenState();
  }
}

class AssignmentScreenState extends State<AssignmentScreen> {
  bool showBottomMenu = false;
  bool isExpanded = true;
  bool isExpanded2 = false;

  Widget _mylistview2() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Wrap(
            children: <Widget>[
              ListTile(
                title: Wrap(
                  spacing: 50.0,
                  children: <Widget>[
                    Text("Assignment ${index}"),
                    Text("0${index}/01/2020"),
                  ],
                ),
                trailing: Wrap(
                  spacing: 10,
                  children: <Widget>[
                    InkWell(
                      child: Icon(
                        MdiIcons.download,
                        color: Color.fromRGBO(5, 115, 106, 100),
                      ),
                    ),
                    InkWell(
                      child: Icon(
                        Icons.remove_red_eye,
                        color: Colors.red,
                      ),
                    )
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
    var ScreenWidth = MediaQuery.of(context).size.width;
    double threshold = 100;
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
                  Text(parentAuthChk.data.displayAs,
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
                    "ASSIGNMENTS",
                    style: TextStyle(fontSize: 15.0, letterSpacing: 1.5),
                  ),
                ),
              ),
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
                        "Raheel zain",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 12.0, right: 12.0, top: 65.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(228, 229, 230, 10)),
                        child: ExpansionTile(
                          initiallyExpanded: true,
                          trailing: isExpanded
                              ? Icon(Icons.keyboard_arrow_up)
                              : Icon(Icons.keyboard_arrow_down),
                          onExpansionChanged: (bool ex) {
                            setState(() {
                              isExpanded = ex;
                            });
                          },
                          title: Text("Assignments"),
                          children: <Widget>[
                            isExpanded
                                ? Container(
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 10.0,
                                              left: 10.0,
                                              bottom: 10.0),
                                          child: SizedBox(
                                              //height: 30.0,
                                              child: Wrap(
                                            spacing: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3.5,
                                            children: <Widget>[
                                              Text(
                                                "Title",
                                                style:
                                                    TextStyle(fontSize: 15.0),
                                              ),
                                              Text(
                                                "Due Date",
                                                style:
                                                    TextStyle(fontSize: 15.0),
                                              ),
                                              Text(
                                                "Actions",
                                                style:
                                                    TextStyle(fontSize: 15.0),
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
          ])),
    ));
  }
}
