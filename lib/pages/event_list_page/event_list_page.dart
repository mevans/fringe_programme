import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fringe_programme/models/event.dart';
import 'package:fringe_programme/pages/event_list_page/event_filter_drawer.dart';
import 'package:fringe_programme/pages/event_list_page/event_page_filter.dart';
import 'package:fringe_programme/pages/event_list_page/event_list.dart';
import 'package:fringe_programme/pages/event_list_page/genre_picker_dialog.dart';
import 'package:fringe_programme/widgets/empty_list.dart';
import 'package:fringe_programme/widgets/fringe_app_bar.dart';
import 'package:fringe_programme/programme_helper.dart';
import 'package:async/async.dart';
import 'package:scoped_model/scoped_model.dart';

class EventListPage extends StatefulWidget {
  final EventPageModel eventFilter;

  EventListPage(this.eventFilter);

  @override
  EventListPageState createState() {
    return new EventListPageState();
  }
}

class EventListPageState extends State<EventListPage>
    with
        TickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<EventListPage> {
  TabController controller;
  Firestore firestore = Firestore.instance;
  Future<QuerySnapshot> _loadEvents;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  TextEditingController textEditingController = new TextEditingController();

  EventListPageState() {
    _loadEvents = firestore.collection("events2019").getDocuments();
    print("LOADING");
  }

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
//    controller.animateTo(EventPageModel.of(context).dateTime.weekday - 5);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    EventPageModel model = EventPageModel.of(context);
//    print(model.dateTime);
    return ScopedModel<EventPageModel>(
      model: widget.eventFilter,
      child: ScopedModelDescendant<EventPageModel>(
        builder: (ctx, child, model) {
          print(TimeOfDay.fromDateTime(model.dateTime));
          textEditingController.text = model.searchTerm;
          return Scaffold(
            key: _scaffoldKey,
            resizeToAvoidBottomPadding: false,
            endDrawer: EventFilterDrawer(model),
            body: FutureBuilder(
              builder: (ctx, snapshot) {
                if (!snapshot.hasData) return Center(child: CupertinoActivityIndicator());
                List<DocumentSnapshot> eventSnapshots = snapshot.data.documents;
                List<Event> events = eventSnapshots
                    .map((ds) => Event.fromDocument(ds))
                    .toList()
                      ..sort((e1, e2) => e1.startTime.compareTo(e2.startTime));
                events = model.applyFilter(events);
                if (model.searchTerm.isNotEmpty && events.length != 0) {
                  if (events.where((e) => e.day == model.dateTime).length == 0) {
                    controller.index = events.firstWhere((e) => e.startTime.isAfter(model.dateTime)).day.day-5;
                  }
                }
                return events.length != 0
                    ? TabBarView(
                        controller: controller,
                        children: <Widget>[
                          EventList(
                              events, DateTime(2019, 7, 5), model.dateTime),
                          EventList(
                              events, DateTime(2019, 7, 6), model.dateTime),
                          EventList(
                              events, DateTime(2019, 7, 7), model.dateTime),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          EmptyList(Icons.import_contacts,
                              "No events have been found, maybe change the filter?"),
                          FlatButton(
                              onPressed: () {
                                model.clearFilter();
                              },
                              child: Text("Clear Filter"))
                        ],
                      );
              },
              future: _loadEvents,
            ),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0.0,
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(bottom: 46.0),
                child: FringeAppBar("Events"),
              ),
              backgroundColor: Theme.of(context).accentColor,
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: "Friday",
                  ),
                  Tab(
                    text: "Saturday",
                  ),
                  Tab(
                    text: "Sunday",
                  )
                ],
                controller: controller,
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.sort),
                  onPressed: () {
                    _scaffoldKey.currentState.openEndDrawer();
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
