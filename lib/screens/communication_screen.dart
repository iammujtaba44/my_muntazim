import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_muntazim/services/modelPasser.dart';

class CommunicationScreen extends StatefulWidget {
  @override
  static String id = 'communicationScreen';
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CommunicationScreenState();
  }
}

class CommunicationScreenState extends State<CommunicationScreen> {
  bool showBottomMenu = false;
  final notifications = [
    'bike',
    'boat',
    'bus',
    'car',
    'railway',
    'run',
    'subway',
    'transit',
    'walk'
  ];

  Widget _mylistview() {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
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
              backgroundColor: Color.fromRGBO(228, 229, 230, 10),
              child: IconButton(
                icon: Icon(
                  Icons.person,
                  size: 32.0,
                ),
              ),
            ),
            title: Text(
              notifications[index],
              style: TextStyle(
                  color: Color.fromRGBO(5, 115, 106, 10),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Day Date"),
            trailing: Wrap(
              spacing: 5, // space between two icons
              children: <Widget>[
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Color.fromRGBO(108, 171, 145, 10),
                  child: InkWell(
                    child: Icon(
                      Icons.call,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Fluttertoast.showToast(
                          msg: "call btn ${index} tapped",
                          toastLength: Toast.LENGTH_SHORT);
                    },
                  ),
                ),

                InkWell(
                  child: Icon(
                    Icons.more_vert,
                    color: Color.fromRGBO(5, 115, 106, 10),
                    size: 30.0,
                  ),
                  onTap: () {
                    Fluttertoast.showToast(
                        msg: "More btn ${index} tapped",
                        toastLength: Toast.LENGTH_SHORT);
                  },
                ),
                // icon-1
                // icon-2
              ],
            ),
          ),
        );
      },
    );
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
                padding: EdgeInsets.only(
                    left: ScreenWidth =
                        MediaQuery.of(context).size.width * 0.1),
                child: Text(
                  "COMMUNICATION",
                  style: TextStyle(fontSize: 15.0, letterSpacing: 1.5),
                ),
              )),
            ),
            SliverFillRemaining(
              child: Stack(
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.only(bottom: 50),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      width: MediaQuery.of(context).size.width,
                      height: Screenheight / 1.7,
                      child: _mylistview()),
                ],
              ),
            )
          ])),
    ));
  }
}
