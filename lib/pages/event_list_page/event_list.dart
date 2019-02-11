import 'package:flutter/material.dart';
import 'package:fringe_programme/models/venue.dart';
import 'package:fringe_programme/pages/event_list_page/event_list_item.dart';
import 'package:fringe_programme/models/event.dart';
import 'package:fringe_programme/programme_helper.dart';

class EventList extends StatelessWidget {
  final List<Event> allEvents;
  final DateTime day;

  EventList(this.allEvents, this.day);

  @override
  Widget build(BuildContext context) {
    List<Event> dayEvents = allEvents.where((e) {
      return e.day.day == day.day;
    }).toList();
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return EventListItem(dayEvents[index]);
      },
      itemCount: dayEvents.length,
    );
  }
}
