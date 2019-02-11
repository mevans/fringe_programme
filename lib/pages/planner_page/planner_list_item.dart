import 'package:flutter/material.dart';
import 'package:fringe_programme/database_helper.dart';
import 'package:fringe_programme/models/event.dart';
import 'package:fringe_programme/pages/event_page/event_page.dart';
import 'package:fringe_programme/pages/planner_page/planner_page.dart';

class EventListTile extends StatelessWidget {
  final Event event;
  final VoidCallback callback;

  EventListTile(this.event, this.callback);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => EventPage(event)));
      },
      child: Padding(
        padding: const EdgeInsets.only(
            top: 10.0, left: 10, right: 10),
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
                    "${["Friday", "Saturday", "Sunday"][event.day.weekday-5]} ${TimeOfDay.fromDateTime(event.startTime).format(context)} - ${TimeOfDay.fromDateTime(event.endTime).format(context)}",
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
                              builder: (ctx) => NotificationDialog());
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.navigation,
                          size: 20,
                        ),
                        onPressed: () {},
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
