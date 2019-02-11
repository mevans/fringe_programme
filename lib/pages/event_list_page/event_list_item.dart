import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fringe_programme/models/event.dart';
import 'package:fringe_programme/pages/event_page/event_page.dart';
import 'package:fringe_programme/programme_helper.dart';

class EventListItem extends StatelessWidget {
  final Event event;

  EventListItem(this.event);

  @override
  Widget build(BuildContext context) {
    var title = Hero(
      tag: event.toString() + "/title",
      child: Material(
        color: Colors.transparent,
        child: Text(
          event.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
    var image = Hero(
      tag: event.toString() + "/image",
      child: Image.asset(
        "assets/event_images/${event.image}",
        fit: BoxFit.cover,
        height: 100,
        width: 100,
      ),
    );
    var performer = Hero(
      tag: event.toString() + "/performer",
      child: Material(
        color: Colors.transparent,
        child: Text(event.performer,
            style: TextStyle(
                fontStyle: FontStyle.italic, color: Color(0xcb000000))),
      ),
    );
    var genre = Container(
      child: Text(
        event.genre.toUpperCase(),
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 9.0),
      ),
      color: ProgrammeHelper.genres[event.genre],
      padding: EdgeInsets.only(left: 3, right: 3, top: 3, bottom: 2),
    );
    var description = Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Text(
        event.description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 13.0),
      ),
    );
    var venue = Row(
      children: <Widget>[
        Icon(
          Icons.location_on,
          size: 14.0,
        ),
        SizedBox(
          width: 3,
        ),
        Expanded(
          child: Text(
            event.venue,
            style: TextStyle(fontSize: 12.0),
          ),
        ),
      ],
    );
    var time = Row(
      children: <Widget>[
        Icon(
          Icons.access_time,
          size: 14.0,
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          "${TimeOfDay.fromDateTime(event.startTime).format(context)} ${!Platform.isIOS ? event.startTime.hour < 12 ? "AM" : "PM" : ""}",
          style: TextStyle(fontSize: 12.0),
        ),
      ],
    );

    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => EventPage(event)));
      },
      child: Padding(
        padding: const EdgeInsets.only(left:8, right: 8, top: 8, bottom: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            image,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    genre,
                    SizedBox(height: 3),
                    title,
                    performer,
                    description,
                    SizedBox(height: 7),
                    time,
                    SizedBox(height: 3),
                    venue,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
