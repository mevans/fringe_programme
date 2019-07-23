import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fringe_programme/models/venue.dart';
import 'package:fringe_programme/pages/event_list_page/event_list_item.dart';
import 'package:fringe_programme/models/event.dart';
import 'package:fringe_programme/programme_helper.dart';

class EventList extends StatefulWidget {
  final List<Event> allEvents;
  final DateTime day;
  final DateTime currentTime;

  EventList(this.allEvents, this.day, this.currentTime);

  @override
  EventListState createState() {
    return new EventListState();
  }
}

class EventListState extends State<EventList> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    List<Event> dayEvents = widget.allEvents.where((e) {
      return e.day.day == widget.day.day;
    }).toList();

    List<Event> previousEvents = dayEvents
        .where((e) =>
            e.startTime.isBefore(widget.currentTime) ||
            e.startTime.isAtSameMomentAs(widget.currentTime))
        .toList()
          ..sort((e1, e2) => e1.startTime.compareTo(e2.startTime));

    List<Event> upcoming = dayEvents
        .where((e) => e.startTime.isAfter(widget.currentTime))
        .toList()
          ..sort((e1, e2) => e1.startTime.compareTo(e2.startTime));
    if (previousEvents.length == 0 || upcoming.length == 0) {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return EventListItem(previousEvents.length == 0
              ? upcoming[index]
              : previousEvents[index], over: upcoming.length == 0,);
        },
        itemCount: max(previousEvents.length, upcoming.length),
      );
    } else {
      return ListView(
        children: <Widget>[
          ExpansionTile(
            title: Text("Previous Events"),
            children: previousEvents
                .map((e) => EventListItem(
                      e,
                      over: upcoming.length == 0,
                    ))
                .toList(),
          ),
          Column(
            children: upcoming.map((e) => EventListItem(e)).toList(),
          )
        ],
      );
    }
  }

  @override
  bool get wantKeepAlive => true;
}
