import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fringe_programme/database_helper.dart';
import 'package:fringe_programme/fringe_programme_font_icons.dart';
import 'package:fringe_programme/models/event.dart';
import 'package:fringe_programme/models/venue.dart';
import 'package:fringe_programme/programme_helper.dart';
import 'package:fringe_programme/widgets/fringe_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class EventPage extends StatefulWidget {
  final Event event;

  EventPage(this.event);

  @override
  EventPageState createState() {
    return new EventPageState();
  }
}

class EventPageState extends State<EventPage> {
  void toggleFavourite() {
    setState(() {
      if (DatabaseHelper.containsEvent(widget.event.ref)) {
        DatabaseHelper.removeEvent(widget.event.ref);
      } else {
        DatabaseHelper.addEvent(widget.event.ref);
      }
    });
  }

  String formatMinutes(int numberOfMinutes) {
    if (numberOfMinutes >= 60) {
      int hours = (numberOfMinutes.toDouble() / 60).floor();
      int minutes = numberOfMinutes - (hours * 60);
      return "${(numberOfMinutes.toDouble() / 60).floor()} hour${hours > 1 ? "s" : ""}${minutes > 0 ? " $minutes minutes" : ""}";
    } else {
      return "$numberOfMinutes minutes}";
    }
  }

  @override
  Widget build(BuildContext context) {
    var title = Text(
      widget.event.title,
      style: Theme.of(context)
          .textTheme
          .title
          .copyWith(fontSize: 22.0, color: Colors.white),
    );
    var performer = Text(
      widget.event.performer,
      style: Theme.of(context).textTheme.subhead.copyWith(
          fontSize: 16.0,
          fontStyle: FontStyle.italic,
          color: Color(0xcbffffff)),
      textAlign: TextAlign.center,
    );
    var description = Padding(
      padding: const EdgeInsets.only(
          top: 16.0, left: 32.0, right: 32.0, bottom: 12.0),
      child: Text(
        widget.event.description,
        style: TextStyle(fontSize: 15.0),
      ),
    );
    var time = Column(
      children: <Widget>[
        Text(
          "Time",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          "${TimeOfDay.fromDateTime(widget.event.startTime).format(context)} ${!Platform.isIOS ? widget.event.startTime.hour < 12 ? "AM" : "PM" : ""} - ${TimeOfDay.fromDateTime(widget.event.endTime).format(context)} ${!Platform.isIOS ? widget.event.endTime.hour < 12 ? "AM" : "PM" : ""}\n(${formatMinutes(widget.event.endTime.difference(widget.event.startTime).inMinutes)})",
          textAlign: TextAlign.center,
        ),
      ],
    );
    var cost = Column(
      children: <Widget>[
        Text(
          "Cost",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          widget.event.entryType,
          textAlign: TextAlign.center,
        ),
        widget.event.entryDetails.isNotEmpty
            ? Text(
                widget.event.entryDetails,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10),
              )
            : Container()
      ],
    );
    var venue = Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.navigation),
          onPressed: () async {
            Venue v = ProgrammeHelper.getVenueFromName(widget.event.venue);
            if (await canLaunch(
                "https://www.google.com/maps/search/?api=1&query=${v.location.latitude},${v.location.longitude}")) {
              launch(
                  "https://www.google.com/maps/search/?api=1&query=${v.location.latitude},${v.location.longitude}");
            } else if (await canLaunch(
                "geo:${v.location.latitude},${v.location.longitude}")) {
              launch("geo:${v.location.latitude},${v.location.longitude}");
            } else if (await canLaunch(
                "http://maps.apple.com/?ll=${v.location.latitude},${v.location.longitude}")) {
              launch(
                  "http://maps.apple.com/?ll=${v.location.latitude},${v.location.longitude}");
            } else {
              showDialog(
                  context: context,
                  builder: (ctx) {
                    return AlertDialog(
                      title: Text("Can't Navigate"),
                      content: Text("No maps application found"),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Ok"),
                        )
                      ],
                    );
                  });
            }
          },
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Text(
                "Venue",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                widget.event.venue,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        )
      ],
    );
    var entry = Column(
      children: <Widget>[
        Text(
          "Age Restriction",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          widget.event.ageRestriction,
          textAlign: TextAlign.center,
        )
      ],
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        flexibleSpace: FringeAppBar("Event"),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share("Omg I'm sharing ${widget.event.title}");
            },
          ),
          Builder(
            builder: (ctx) => IconButton(
                  icon: Icon(
                    DatabaseHelper.containsEvent(widget.event.ref)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Scaffold.of(ctx).showSnackBar(DatabaseHelper.containsEvent(
                            widget.event.ref)
                        ? SnackBar(
                            content: Text(
                              "${widget.event.title} has been been un-saved",
                            ),
                            action: SnackBarAction(
                                label: "Undo",
                                onPressed: () {
                                  toggleFavourite();
                                }),
                          )
                        : SnackBar(
                            content:
                                Text("${widget.event.title} has been saved!")));
                    toggleFavourite();
                  },
                ),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: <Widget>[
              Image.asset(
                "assets/event_images/${widget.event.image}",
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: EdgeInsets.only(left: 16, top: 32, bottom: 16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black54,
                        Colors.black12,
                        Colors.transparent
                      ],
                      end: Alignment.topCenter,
                      begin: Alignment.bottomCenter,
                      stops: [0, 0.7, 1],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            title,
                            performer,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            color: ProgrammeHelper.genres[widget.event.genre],
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Center(
              child: Text(
                widget.event.genre,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: time,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: venue,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: cost,
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: entry,
                    ))
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          description,
          Divider(
            height: 0,
          ),
          SocialMediaRow(
              Icon(
                FringeProgrammeFont.facebook,
                color: Colors.blue,
              ),
              widget.event.facebook),
          SocialMediaRow(
              Icon(
                FringeProgrammeFont.twitter,
                color: Colors.lightBlueAccent,
              ),
              widget.event.twitter),
          SocialMediaRow(
              Icon(
                FringeProgrammeFont.instagram,
                color: Colors.purple,
              ),
              widget.event.instagram),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class SocialMediaRow extends StatelessWidget {
  final Icon icon;
  final String text;

  SocialMediaRow(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launch("https://$text");
      },
      child: text != "null" && text.length != 0
          ? Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 32, right: 32, top: 12, bottom: 12),
                  child: Row(
                    children: <Widget>[
                      icon,
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          text,
                          style: TextStyle(
                              color: Colors.blueAccent,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 0,
                )
              ],
            )
          : Container(),
    );
  }
}
