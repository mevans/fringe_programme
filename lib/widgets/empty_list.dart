import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  final IconData iconData;
  final String text;

  EmptyList(this.iconData, this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(64.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              iconData,
              size: 42,
              color: Colors.black54,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}