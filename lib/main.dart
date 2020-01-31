import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fringe_programme/models/event.dart';
import 'package:fringe_programme/pages/bottom_navigation/bottom_navigation.dart';
import 'package:fringe_programme/pages/event_list_page/event_list_page.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fringe_programme/database_helper.dart';
import 'package:fringe_programme/pages/event_page/event_page.dart';
import 'package:fringe_programme/widgets/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Shaftesbury Fringe 2019",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xffb30075),
          accentColor: Color(0xffffa12d),
          scaffoldBackgroundColor: Colors.white),
    ),
  );
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.orange,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Shaftesbury",
                        style: TextStyle(
                          fontSize: 40,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(
                        "Fringe",
                        style: TextStyle(
                          fontSize: 40,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "2019",
                        style: TextStyle(
                          fontSize: 40,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GridView.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                crossAxisCount: 2,
                children: <Widget>[
                  ColorTile("Events", Theme.of(context).primaryColor,
                      Icons.music_note, 0),
                  ColorTile("Venues", Theme.of(context).accentColor,
                      Icons.account_balance, 1),
                  ColorTile("Your Planner", Colors.green, Icons.book, 2),
                  ColorTile("Social Media", Colors.blue, Icons.settings, 3)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ColorTile extends StatelessWidget {
  final String text;
  final Color color;
  final IconData iconData;
  final int page;

  ColorTile(this.text, this.color, this.iconData, this.page);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (ctx) => BottomNavigationManager(
                    initialPage: page,
                  )));
        },
        child: Material(
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                iconData,
                color: Colors.white,
                size: 36,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
