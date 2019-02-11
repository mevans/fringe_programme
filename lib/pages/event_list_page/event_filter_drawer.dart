import 'package:flutter/material.dart';
import 'package:fringe_programme/pages/event_list_page/event_page_filter.dart';
import 'package:fringe_programme/pages/event_list_page/genre_picker_dialog.dart';
import 'package:fringe_programme/programme_helper.dart';

class EventFilterDrawer extends StatefulWidget {
  final EventPageModel model;

  EventFilterDrawer(this.model);

  @override
  _EventFilterDrawerState createState() => _EventFilterDrawerState();
}

class _EventFilterDrawerState extends State<EventFilterDrawer> {
  TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController =
        TextEditingController(text: widget.model.searchTerm);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: DropdownButtonHideUnderline(
        child: ListView(
          padding: EdgeInsets.only(left: 16, right: 16, top: 16),
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16, left: 16),
                child: Text(
                  "Filter Events",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: TextField(
                  onChanged: (s) {
                    widget.model.updateModel(searchTerm: s);
                  },
                  controller: textEditingController,
                  decoration: InputDecoration(
                    labelText: "Search...",
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(Icons.beach_access),
              title: Text("Genre"),
              subtitle: Text(widget.model.genres.length !=
                  ProgrammeHelper.genres.keys.length
                  ? widget.model.genres
                  .map((s) =>
              "${s.substring(0, 1).toUpperCase()}${s.substring(1)}")
                  .join(", ")
                  : "Any"),
              trailing: Icon(
                  Icons.arrow_drop_down
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return GenrePickerDialog(widget.model.genres);
                    }).then((d) {
                  print(d);
                  if (d != null) widget.model.updateModel(genres: d);
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text("Entry Type"),
              subtitle: DropdownButton(
                isDense: true,
                isExpanded: true,
                items: [
                  "Any",
                  "Free",
                  "Pass-The-Hat",
                  "Charity Collection",
                  "Donation On The Door",
                  "Pay On The Door",
                  "Pay What It's Worth",
                  "Tickets In Advance"
                ]
                    .map(
                      (s) => DropdownMenuItem(
                    child: Text(
                      s,
                      style: TextStyle(
                          fontSize: 13, color: Color(0xaa000000)),
                    ),
                    value: s,
                  ),
                )
                    .toList(),
                onChanged: (s) {
                  widget.model.updateModel(entryType: s);
                },
                value: widget.model.entryType,
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Age Restriction"),
              subtitle: DropdownButton(
                isDense: true,
                isExpanded: true,
                items: [
                  "Any",
                  "None",
                  "Children Only",
                  "Suitable For Children",
                  "10+",
                  "12+",
                  "14+",
                  "16+",
                  "18+"
                ]
                    .map(
                      (s) => DropdownMenuItem(
                    child: Text(
                      s,
                      style: TextStyle(
                          fontSize: 13, color: Color(0xaa000000)),
                    ),
                    value: s,
                  ),
                )
                    .toList(),
                onChanged: (s) {
                  widget.model.updateModel(ageRestriction: s);
                },
                value: widget.model.ageRestriction,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              child: FlatButton(
                onPressed: () {
                  widget.model.clearFilter();
                  Navigator.of(context).pop();
                },
                child: Text("Clear"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}