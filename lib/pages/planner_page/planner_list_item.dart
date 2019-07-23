import 'package:flutter/material.dart';
import 'package:fringe_programme/database_helper.dart';
import 'package:fringe_programme/models/event.dart';
import 'package:fringe_programme/models/venue.dart';
import 'package:fringe_programme/pages/event_page/event_page.dart';
import 'package:fringe_programme/pages/planner_page/planner_page.dart';
import 'package:fringe_programme/programme_helper.dart';

class EventListTile extends StatelessWidget {
  final Event event;
  final VoidCallback callback;

  EventListTile(this.event, this.callback);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => EventPage(event)));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              "assets/event_images/${event.image}",
              height: 100,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    event.title,
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 16),
                  ),
                  Text(
                    "${[
                      "Friday",
                      "Saturday",
                      "Sunday"
                    ][event.day.weekday - 5]} ${TimeOfDay.fromDateTime(event.startTime).format(context)} - ${TimeOfDay.fromDateTime(event.endTime).format(context)}",
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                  Text(
                    event.venue,
                    style: TextStyle(color: Colors.black54),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.notifications_active,
                          size: 20,
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (ctx) => NotificationDialog(
                                  initialTime:
                                      DatabaseHelper.getNotificationTime(
                                          event.ref),
                                  eventTime: event.startTime)).then((d) {
                                    print(d);
                            DatabaseHelper.deleteNotification(event.ref);
                            if (d != 0 || d != null) {
                              print('not d');
                              DateTime time =
                                  DateTime.fromMillisecondsSinceEpoch(d);
                              DatabaseHelper.addNotification(
                                  event.ref, d, event);
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "You'll be notified for the event at ${time.hour.toString()}:${time.minute.toString().padLeft(2, "0")}"),
                                duration: Duration(seconds: 1),
                              ));
                            } else {
                              DatabaseHelper.deleteNotification(event.ref);
                              Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      "You won't be notified for this event"),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            }
                            print(DatabaseHelper.eventList);
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.navigation,
                          size: 20,
                        ),
                        onPressed: () {
                          Venue v =
                              ProgrammeHelper.getVenueFromName(event.venue);
                          v.navigateTo(context);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.clear,
                          size: 20,
                        ),
                        onPressed: () {
                          DatabaseHelper.removeEvent(event.ref);
                          callback();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
