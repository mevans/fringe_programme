import 'package:flutter/material.dart';
import 'package:fringe_programme/programme_helper.dart';
import 'package:fringe_programme/programme_helper.dart' as prefix0;

class VenuePickerDialog extends StatefulWidget {
  final List<int> initialVenues;

  VenuePickerDialog(this.initialVenues);

  @override
  _VenuePickerDialogState createState() => _VenuePickerDialogState();
}

class _VenuePickerDialogState extends State<VenuePickerDialog> {
  Map<int, bool> venues = new Map();

  @override
  void initState() {
    super.initState();
    ProgrammeHelper.allVenues.forEach((v) {
      venues[v.id] = widget.initialVenues.contains(v.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(top: 8),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Venues"),
          FlatButton(
            child: Text("Clear All"),
            onPressed: () {
              setState(() {
                venues.forEach((s, b) => venues[s] = false);
              });
            },
          )
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: ProgrammeHelper.allVenues.map((v) {
            return CheckboxListTile(
                dense: true,
                controlAffinity: ListTileControlAffinity.trailing,
                title: Text(
                  "${v.venueName} - ${v.space}",
                ),
                value: venues[v.id],
                onChanged: (b) {
                  setState(() {
                    venues[v.id] = b;
                  });
                });
          }).toList(),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Cancel"),
        ),
        FlatButton(
          onPressed: () {
            List<int> selectedVenues = [];
            venues.forEach((i, b) {
              if (b) selectedVenues.add(i);
            });
            Navigator.of(context).pop(selectedVenues);
          },
          child: Text("Ok"),
        ),
      ],
    );
  }
}
