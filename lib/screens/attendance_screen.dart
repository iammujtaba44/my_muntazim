import 'dart:ui';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:my_muntazim/services/modelPasser.dart';

class AttendanceScreen extends StatefulWidget {
  static String id = 'attendanceScreen';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AttendanceScreenState();
  }
}

List<DateTime> presentDates = [];
List<DateTime> absentDates = [];

class AttendanceScreenState extends State<AttendanceScreen> {
  DateTime _currentDate2 = DateTime.now();
  int a;
  bool showBottomMenu = false;
  double cHeight;
  var len = 9;
  CalendarCarousel _calendarCarouselNoHeader;
  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {},
  );

  static Widget _presentIcon(String day) => Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(
            Radius.circular(1000),
          ),
        ),
        child: Center(
          child: Text(
            day,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      );

  static Widget _absentIcon(String day) => Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(
            Radius.circular(1000),
          ),
        ),
        child: Center(
          child: Text(
            day,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      );

  evnetsFiller() {
    for (int i = 0; i < len; i++) {
      a = i + 1;
      presentDates.add(new DateTime(2020, 8, a));
    }
    a = 0;
    for (int i = 0; i < len; i++) {
      a = i + 1;
      absentDates.add(new DateTime(2020, 7, a));
    }

    for (int i = 0; i < len; i++) {
      _markedDateMap.add(
        presentDates[i],
        new Event(
          date: presentDates[i],
          title: 'Event 5',
          icon: _presentIcon(
            presentDates[i].day.toString(),
          ),
        ),
      );
    }

    for (int i = 0; i < len; i++) {
      _markedDateMap.add(
        absentDates[i],
        new Event(
          date: absentDates[i],
          title: 'Event 5',
          icon: _absentIcon(
            absentDates[i].day.toString(),
          ),
        ),
      );
    }
  }

  cal() {
    return CalendarCarousel<Event>(
      // height: cHeight / 2,
      // width: cwid / 1.2,
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate2 = date);
        events.forEach((event) => print(event.title));
      },
      showOnlyCurrentMonthDate: true,
      headerTextStyle: TextStyle(color: Color.fromRGBO(5, 115, 106, 10)),
      headerTitleTouchable: true,
      headerMargin: EdgeInsets.all(1),
      leftButtonIcon: IconButton(
        icon: Icon(
          Icons.arrow_left,
          color: Color.fromRGBO(5, 115, 106, 10),
        ),
      ),
      rightButtonIcon: IconButton(
        icon: Icon(
          Icons.arrow_right,
          color: Color.fromRGBO(5, 115, 106, 10),
        ),
      ),
      dayPadding: 6,
      daysTextStyle: TextStyle(color: Colors.grey),
      weekDayBackgroundColor: Color.fromRGBO(228, 229, 230, 10),
      weekdayTextStyle: TextStyle(color: Color.fromRGBO(5, 115, 106, 10)),
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),

      customGridViewPhysics: NeverScrollableScrollPhysics(),
      selectedDateTime: _currentDate2,
      todayButtonColor: Colors.blue[200],
      markedDatesMap: _markedDateMap,
      markedDateShowIcon: true,
      markedDateIconMaxShown: 1,
      markedDateMoreShowTotal: null,

      markedDateCustomTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
      // null for not showing hidden events indicator
      markedDateIconBuilder: (event) {
        return event.icon;
      },
      minSelectedDate: _currentDate2.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate2.add(Duration(days: 360)),
    );
  }

  var cwid;

  Widget build(BuildContext context) {
    var Screenheight = MediaQuery.of(context).size.height;
    cHeight = MediaQuery.of(context).size.height;
    cwid = MediaQuery.of(context).size.width;
    evnetsFiller();
    _calendarCarouselNoHeader = cal();

    return Scaffold(
        body: ColorfulSafeArea(
      color: Color.fromRGBO(108, 171, 145, 10),
      minimum: EdgeInsets.only(top: 42.0),
      child: Container(
          height: Screenheight,
          width: cwid,
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
                  Text("Raheel zain",
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
                padding: EdgeInsets.only(left: cwid * 0.1),
                child: Text(
                  "ATTENDANCE",
                  style: TextStyle(fontSize: 15.0),
                ),
              )),
            ),
            SliverFillRemaining(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 100.0,
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
                        parentAuthChk.data.displayAs,
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 60.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.8,
                      child: _calendarCarouselNoHeader,
                    ),
                  ),
                  AnimatedPositioned(
                    curve: Curves.easeInOut,
                    duration: Duration(milliseconds: 200),
                    left: 20,
                    right: 20,
                    bottom: (showBottomMenu)
                        ? -60
                        : -(MediaQuery.of(context).size.height / 3.5),
                    child: ShowNoticeBoardMenu(),
                  )
                ],
              ),
            )
          ])),
    ));
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
              IconButton(
                icon: Icon(
                  Icons.maximize,
                  size: 40,
                ),
                color: Color.fromRGBO(228, 229, 230, 10),
                onPressed: () {
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
}
