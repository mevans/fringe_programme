import 'dart:io';

import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class FringeLocation {
  final LatLng location;
  FringeLocation({this.location});

  void navigateTo(BuildContext context) async {
    if (await canLaunch(
        "http://maps.apple.com/maps?saddr=&daddr=${location.latitude},${location.longitude}&dirflg=w")) {
      launch(
          "http://maps.apple.com/maps?saddr=&daddr=${location.latitude},${location.longitude}&dirflg=w");
    } else if (await canLaunch(
        "https://www.google.com/maps/search/?api=1&query=${location.latitude},${location.longitude}&travelmode=walking&dir_action=navigate")) {
      launch(
          "https://www.google.com/maps/search/?api=1&query=${location.latitude},${location.longitude}&travelmode=walking&dir_action=navigate");
    } else if (await canLaunch(
        "geo:${location.latitude},${location.longitude}")) {
      launch("geo:${location.latitude},${location.longitude}");
    }else {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text("Can't Navigate"),
              content: Text("No maps application found"),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Ok"),
                )
              ],
            );
          });
    }
  }
}
