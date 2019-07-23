import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fringe_programme/models/event.dart';
import 'package:fringe_programme/pages/event_list_page/event_page_filter.dart';
import 'package:fringe_programme/pages/event_list_page/event_list_page.dart';
import 'package:fringe_programme/pages/event_page/event_page.dart';
import 'package:fringe_programme/pages/fringe_2019/fringe_2019_page.dart';
import 'package:fringe_programme/pages/planner_page/planner_page.dart';
import 'package:fringe_programme/pages/map_page/map_page.dart';
import 'package:fringe_programme/database_helper.dart';

class BottomNavigationManager extends StatefulWidget {
  final int initialPage;
  BottomNavigationManager({this.initialPage});

  @override
  _BottomNavigationManagerState createState() =>
      _BottomNavigationManagerState();
}

class _BottomNavigationManagerState extends State<BottomNavigationManager> {
  int currentPage;
  PageController controller;
  EventPageModel filter;

  @override
  void initState() {
    super.initState();
    currentPage = widget.initialPage;
    controller = PageController(keepPage: true, initialPage: widget.initialPage);
    filter = EventPageModel.zero();
  }

  void setPage(int newPage) {
    setState(() {
      controller.jumpToPage(newPage);
      currentPage = newPage;
    });
  }


  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var initializationSettingsAndroid = new AndroidInitializationSettings('ic_launcher');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(initializationSettingsAndroid, initializationSettingsIOS);
    Future onSelectNotification(String p)async {
      Firestore.instance.collection("events2019").document(p).get().then((ds) {
        Navigator.push(context, MaterialPageRoute(builder: (ctx) => EventPage(Event.fromDocument(ds))));
      });
    }
    DatabaseHelper.flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: onSelectNotification);
    return Scaffold(
      body: PageView(
          controller: controller,
          physics: NeverScrollableScrollPhysics(),
          children: [
            EventListPage(filter),
            MapPage(),
            PlannerPage(),
            Fringe2019Page()
          ]),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
//          Material(
//            color: Color(0xff658770),
//            child: InkWell(
//              onTap: () {
//                launch("https://www.coffee1.co.uk/");
//              },
//              child: Center(
//                child: Padding(
//                  padding: const EdgeInsets.symmetric(vertical: 12.0),
//                  child: Row(
//                    mainAxisSize: MainAxisSize.max,
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Text(
//                        "Coffee #1 is the best coffee house in Shaftesbury",
//                        style: TextStyle(
//                          color: Colors.white,
//                        ),
//                      ),
//                      Icon(
//                        Icons.chevron_right,
//                        color: Colors.white,
//                      )
//                    ],
//                  ),
//                ),
//              ),
//            ),
//          ),
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.music_note),
                  title: Text("Events"),
                  backgroundColor: Theme.of(context).primaryColor),
              BottomNavigationBarItem(
                  icon: Icon(Icons.map),
                  title: Text("Map"),
                  backgroundColor: Theme.of(context).primaryColor),
              BottomNavigationBarItem(
                  icon: Icon(Icons.book),
                  title: Text("Planner"),
                  backgroundColor: Theme.of(context).primaryColor),
              BottomNavigationBarItem(
                  icon: Icon(Icons.event_note),
                  title: Text("Fringe 2019"),
                  backgroundColor: Theme.of(context).primaryColor),
            ],
            currentIndex: currentPage,
            onTap: (i) async {
              setPage(i);
            },
          ),
        ],
      ),
    );
  }
}
