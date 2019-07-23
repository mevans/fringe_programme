import 'package:flutter/material.dart';
import 'package:fringe_programme/pages/bottom_navigation/bottom_navigation.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(
          "assets/home_screen/background.jpg",
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.black.withOpacity(0.47),
        ),
        Positioned(
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: Theme.of(context).accentColor,
                  child: SafeArea(
                    bottom: false,
                    child: Image.asset(
                      "assets/logos/fringelogo.png",
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
                SizedBox(height: 24),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (ctx) => BottomNavigationManager(
                              initialPage: 0,
                            )));
                  },
                  child: Container(
                    color: Colors.white.withOpacity(0.3),
                    padding: EdgeInsets.only(
                        left: 32, top: 12, right: 16, bottom: 12),
                    child: Text(
                      "Events",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                                  builder: (ctx) => BottomNavigationManager(
                                        initialPage: 1,
                                      )));
                        },
                        child: Container(
                          color: Colors.white.withOpacity(0.3),
                          padding: EdgeInsets.only(
                              left: 32, top: 12, right: 16, bottom: 12),
                          child: Text(
                            "Map",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                                  builder: (ctx) => BottomNavigationManager(
                                        initialPage: 2,
                                      )));
                        },
                        child: Container(
                          color: Colors.white.withOpacity(0.3),
                          padding: EdgeInsets.only(
                              left: 32, top: 12, right: 16, bottom: 12),
                          child: Text(
                            "Planner",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
