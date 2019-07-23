import 'package:flutter/material.dart';
import 'package:fringe_programme/programme_helper.dart';

class GenrePickerDialog extends StatefulWidget {
  final List<String> initialGenres;

  GenrePickerDialog(this.initialGenres);

  @override
  _GenrePickerDialogState createState() => _GenrePickerDialogState();
}

class _GenrePickerDialogState extends State<GenrePickerDialog> {
  Map<String, bool> genres = new Map();

  @override
  void initState() {
    super.initState();
    ProgrammeHelper.genres.keys.forEach((s) {
      genres[s] = widget.initialGenres.contains(s);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(top: 8),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Genres"),
          FlatButton(
            child: Text("Clear All"),
            onPressed: () {
              setState(() {
                genres.forEach((s, b) => genres[s] = false);
              });
            },
          )
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: ProgrammeHelper.genres.keys.map((s) {
            return CheckboxListTile(
                dense: true,
                controlAffinity: ListTileControlAffinity.trailing,
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                          color: ProgrammeHelper.genres[s],
                          shape: BoxShape.circle),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        "${s.substring(0, 1).toUpperCase()}${s.substring(1)}",
                      ),
                    ),
                  ],
                ),
                value: genres[s],
                onChanged: (b) {
                  setState(() {
                    genres[s] = b;
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
            List<String> selectedGenres = [];
            genres.forEach((s, b) {
              if (b) selectedGenres.add(s);
            });
            Navigator.of(context).pop(selectedGenres);
          },
          child: Text("Ok"),
        ),
      ],
    );
  }
}
