import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class Event {
  final String title;
  final String performer;
  final String genre;
  final String ageRestriction;
  final String description;
  final String website;
  final String facebook;
  final String instagram;
  final String twitter;
  final String venue;
  final DateTime day;
  final DateTime startTime;
  final DateTime endTime;
  final String entryType;
  final String entryDetails;
  final String image;
  final String ref;

  Event.fromDocument(DocumentSnapshot document)
      : ref = document.reference.documentID,
        title = document["title"],
        image = document["file_name"],
        performer = document["performer"],
        description = document["description"],
        genre = document["genre"],
        venue = document["venue"].toString(),
        website = document["website"]
            .toString()
            .replaceAll("https://", "")
            .replaceAll("http://", ""),
        facebook = document["facebook"]
            .toString()
            .replaceAll("https://", "")
            .replaceAll("http://", ""),
        day = (document["day"] as DateTime),
        startTime = timeOnDate((document["day"] as DateTime),
            (document["start_time"] as DateTime)),
        endTime = timeOnDate((document["day"] as DateTime),
            (document["end_time"] as DateTime)),
        ageRestriction = document["age_restriction"],
        entryDetails = document["entry_details"],
        entryType = document["entry_type"],
        instagram = document["instagram"]
            .toString()
            .replaceAll("https://", "")
            .replaceAll("http://", ""),
        twitter = document["twitter"]
            .toString()
            .replaceAll("https://", "")
            .replaceAll("http://", "");

  @override
  String toString() {
    return 'Event{title: $title, performer: $performer, genre: $genre, ageRestriction: $ageRestriction, description: $description, website: $website, facebook: $facebook, instagram: $instagram, twitter: $twitter, venue: $venue, day: $day, startTime: $startTime, endTime: $endTime, entryType: $entryType, entryDetails: $entryDetails, image: $image, ref: $ref}';
  }
}

DateTime timeOnDate(DateTime date, DateTime time) {
  return DateTime(date.year, date.month, date.day, time.hour, time.minute);
}
