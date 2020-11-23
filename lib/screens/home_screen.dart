import 'dart:ui';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_muntazim/components/CustomListView.dart';
import 'package:my_muntazim/screens/navigation_menu.dart';
import 'package:my_muntazim/services/modelPasser.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home> {
  bool showBottomMenu = false;

  Widget build(BuildContext context) {
    var Screenheight = MediaQuery.of(context).size.height;
    var Screenwidth = MediaQuery.of(context).size.width;
    double threshold = 100;
    return Scaffold(
      body: ColorfulSafeArea(
        color: Color.fromRGBO(108, 171, 145, 10),
        minimum: EdgeInsets.only(top: 42.0),
        child: Container(
          height: Screenheight,
          width: Screenwidth,
          decoration: BoxDecoration(color: Color.fromRGBO(228, 229, 230, 100)),
          child: CustomScrollView(
            slivers: <Widget>[
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
                leading: Icon(Icons.home),
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
                expandedHeight: 130.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: Padding(
                    padding: EdgeInsets.only(left: Screenwidth * 0.1),
                    child: Text(
                      "HOME",
                      style: TextStyle(fontSize: 15.0, letterSpacing: 1.5),
                    ),
                  ),
                ),
              ),
              SliverFillRemaining(
                child: Stack(children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.only(top: 50.0, right: 30.0, left: 30.0),
                    child: Container(
                      height: Screenheight,
                      width: Screenwidth,
                      child: GridView.count(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        children: <Widget>[
                          mycard(
                            name: "Attendance",
                            icon: Icon(
                              Icons.date_range,
                              size: 50.0,
                            ),
                            ontap: () {
                              /* Fluttertoast.showToast(
                                  msg: "Attendance",
                                  toastLength: Toast.LENGTH_LONG); */

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NavigationMenu(
                                          index: 1,
                                        )),
                              );
                              //  Navigator.pushNamed(context, AttendanceScreen.id);
                            },
                          ),
                          mycard(
                            name: "Transcripts",
                            icon: Icon(
                              MdiIcons.roundedCorner,
                              size: 50.0,
                            ),
                            ontap: () {
                              // Fluttertoast.showToast(msg: "Transcript",toastLength: Toast.LENGTH_LONG);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NavigationMenu(
                                          index: 6,
                                        )),
                              );
                            },
                          ),
                          mycard(
                            name: "Assignments",
                            icon: Icon(
                              Icons.assignment,
                              size: 50.0,
                            ),
                            ontap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NavigationMenu(
                                          index: 5,
                                        )),
                              );
                            },
                          ),
                          mycard(
                            name: "Communicate",
                            icon: Icon(
                              MdiIcons.chatProcessing,
                              size: 50.0,
                            ),
                            ontap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NavigationMenu(
                                          index: 3,
                                        )),
                              );
                              //  Navigator.pushNamed(context, AttendanceScreen.id);
                            },
                          ),
                          mycard(
                            name: "Fees/Invoices",
                            icon: Icon(
                              Icons.payment,
                              size: 50.0,
                            ),
                            ontap: () {
                              Fluttertoast.showToast(
                                  msg: "Fees", toastLength: Toast.LENGTH_LONG);
                            },
                          ),
                          mycard(
                            name: "Messages",
                            icon: Icon(
                              MdiIcons.emailVariant,
                              size: 50.0,
                            ),
                            ontap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NavigationMenu(
                                          index: 4,
                                        )),
                              );
                              //  Navigator.pushNamed(context, AttendanceScreen.id);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.only(top: 350.0, left: 35.0),
                          child: Text(
                            "Upcoming Events",
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(5, 115, 106, 30)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 350.0, left: 70.0),
                          child: InkWell(
                            onTap: () {
                              Fluttertoast.showToast(
                                  msg: "view all tapped",
                                  toastLength: Toast.LENGTH_SHORT);

                              showBottomViewAll(context);
                            },
                            child: Text(
                              "View All",
                              style: TextStyle(
                                  color: Color.fromRGBO(5, 115, 106, 10)),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 400.0, left: 30.0),
                    child: Container(
                        // margin: EdgeInsets.symmetric(vertical: 20.0),
                        height: 65.0,
                        child: ListViewFiller(
                          direc: false,
                        )),
                  ),
                  AnimatedPositioned(
                    curve: Curves.easeInOut,
                    duration: Duration(milliseconds: 200),
                    left: 20,
                    right: 20,
                    bottom: (showBottomMenu)
                        ? -60
                        : -(MediaQuery.of(context).size.height / 3.35),
                    child: ShowNoticeBoardMenu(),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ShowNoticeBoardMenu() {
    double heigt = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      child: Container(
        color: Color.fromRGBO(5, 115, 106, 10),
        width: width,
        height: heigt / 4 + 120,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
          child: Column(
            children: <Widget>[
              InkWell(
                child: Icon(
                  Icons.maximize,
                  size: 40,
                  color: Color.fromRGBO(228, 229, 230, 10),
                ),
                onTap: () {
                  if (showBottomMenu == false) {
                    this.setState(() {
                      showBottomMenu = true;
                    });
                  } else if (showBottomMenu == true) {
                    this.setState(() {
                      showBottomMenu = false;
                    });
                  }
                },
              ),
              Text(
                "Notice board",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Here notice board text will be placed accordingly for now it is hardcoded Here notice board text will be placed accordingly for now it is hardcoded",
                style: TextStyle(fontSize: 12, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showBottomViewAll(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(228, 229, 230, 100),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              height: MediaQuery.of(context).size.height / 2.3,
              width: MediaQuery.of(context).size.width / 2,
              child: Column(children: <Widget>[
                Flexible(
                  child: SizedBox(
                    child: ListViewFiller(direc: true),
                  ),
                ),
              ]));
        });
  }
}

class mycard extends StatelessWidget {
  final Icon icon;
  final String name;
  // final String detail;
  final Function ontap;

  mycard({this.name, this.icon, this.ontap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: InkWell(
        onTap: () {
          ontap();
        },
        // hoverColor: Color.fromRGBO(5, 115, 106, 100),
        //  focusColor: Color.fromRGBO(5, 115, 106, 100),
        // highlightColor: Color.fromRGBO(5, 115, 106, 100),
        splashColor: Color.fromRGBO(5, 115, 106, 10),

        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              icon,
              Text(
                name,
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
