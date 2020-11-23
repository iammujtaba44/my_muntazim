import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewFiller extends StatelessWidget {
  final bool direc;

  ListViewFiller({this.direc});
  @override
  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.of(context).size;
    // TODO: implement build
    return ListView.builder(
        itemCount: 5,
        scrollDirection: direc ? Axis.vertical : Axis.horizontal,
        itemBuilder: (context, index) {
          return direc
              ? Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: ScreenSize.width / 1,
                          height: 70.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7.0))),
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 7.0,
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border:
                                      Border.all(width: 2, color: Colors.green),
                                  color: Color.fromRGBO(5, 115, 106, 10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "30",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Aug",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10.0),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 13.0,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Education Competition",
                                    style: TextStyle(
                                        color: Color.fromRGBO(5, 115, 106, 10),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("30 Students participating",
                                      style: TextStyle(fontSize: 12.0))
                                ],
                              ),
                              Spacer(
                                flex: 1,
                              ),
                              Icon(Icons.keyboard_arrow_right)
                            ],
                          )),
                    ],
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(right: 6.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: direc ? ScreenSize.width / 1 : 300.0,
                          height: direc ? 70.0 : 130.0,
                          decoration: BoxDecoration(
                              color: direc ? Colors.grey : Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7.0))),
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 7.0,
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border:
                                      Border.all(width: 2, color: Colors.green),
                                  color: Color.fromRGBO(5, 115, 106, 10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "30",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Aug",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10.0),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 13.0,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Education Competition",
                                    style: TextStyle(
                                        color: Color.fromRGBO(5, 115, 106, 10),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("30 Students participating",
                                      style: TextStyle(fontSize: 12.0))
                                ],
                              ),
                              Spacer(
                                flex: 1,
                              ),
                              Icon(Icons.keyboard_arrow_right)
                            ],
                          )),
                    ],
                  ),
                );
        });
  }
}
