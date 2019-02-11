import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fringe_programme/database_helper.dart';
import 'package:fringe_programme/models/event.dart';
import 'package:fringe_programme/models/venue.dart';
import 'package:fringe_programme/pages/event_page/event_page.dart';
import 'package:fringe_programme/pages/planner_page/planner_list_item.dart';
import 'package:fringe_programme/programme_helper.dart';
import 'package:fringe_programme/widgets/empty_list.dart';
import 'package:fringe_programme/widgets/fringe_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rapido/rapido.dart';

class PlannerPage extends StatefulWidget {
  @override
  PlannerPageState createState() {
    return new PlannerPageState();
  }
}

class PlannerPageState extends State<PlannerPage> with AutomaticKeepAliveClientMixin<PlannerPage>{
  Future<List<DocumentSnapshot>> snapshots(List<String> refs) {
    return Future.wait(refs.map(
        (s) => Firestore.instance.collection("events2019").document(s).get()));
  }

  @override
  Widget build(BuildContext context) {
    DatabaseHelper.eventList.onLoadComplete = (DocumentList dl) {
      setState(() {});
    };
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).accentColor,
          flexibleSpace: FringeAppBar("Planner"),
          elevation: 0.0,
        ),
        body: DatabaseHelper.getSavedEvents().length != 0
            ? FutureBuilder(
                future: snapshots(DatabaseHelper.getSavedEvents()),
                builder: (ctx, snapshot) {
                  if (snapshot.hasData) {
                    List<DocumentSnapshot> snapshots = snapshot.data;
                    List<Event> events = [];
                    snapshots.forEach((ds) {
                      events.add(Event.fromDocument(ds));
                    });
                    return Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.white,
                        accentColor: Colors.black87,
                        iconTheme: IconThemeData(color: Colors.black87)
                      ),
                      child: ListView(
                        children: <Widget>[
                          PlannerExpansion(
                            events, "Friday", 5, () => setState((){})
                          ),
                          PlannerExpansion(
                            events, "Saturday", 6, () => setState((){})
                          ),
                          PlannerExpansion(
                              events, "Sunday", 7, () => setState(() {})),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )
            : EmptyList(Icons.favorite,
                "Click the heart icon on your favourite events to add them to your planner"));
  }

  @override
  bool get wantKeepAlive => true;
}

class NotificationDialog extends StatefulWidget {
  @override
  _NotificationDialogState createState() => _NotificationDialogState();
}

class _NotificationDialogState extends State<NotificationDialog> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Notify Me"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RadioListTile(
            value: 0,
            groupValue: selected,
            onChanged: (b) {
              setState(() {
                selected = b;
              });
            },
            title: Text("None"),
          ),
          RadioListTile(
            value: 1,
            groupValue: selected,
            onChanged: (b) {
              setState(() {
                selected = b;
              });
            },
            title: Text("15 mins before"),
          ),
          RadioListTile(
            value: 2,
            groupValue: selected,
            onChanged: (b) {
              setState(() {
                selected = b;
              });
            },
            title: Text("30 mins before"),
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(onPressed: () {}, child: Text("Cancel")),
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Ok"))
      ],
    );
  }
}

class PlannerExpansion extends StatelessWidget {
  final List<Event> allEvents;
  final String day;
  final int dayOfWeek;
  final VoidCallback onDelete;

  PlannerExpansion(this.allEvents, this.day, this.dayOfWeek, this.onDelete);

  @override
  Widget build(BuildContext context) {
    List<Event> dayEvents = allEvents.where((e) => e.day.day == dayOfWeek).toList()..sort((e1, e2) => e1.startTime.compareTo(e2.startTime));
    return ExpansionTile(
      initiallyExpanded: true,
      title: Text("$day (${dayEvents.length} events)", style: TextStyle(fontSize: 18),),
      children: dayEvents.map((e) => EventListTile(e, () => onDelete())).toList(),
    );
  }
}
