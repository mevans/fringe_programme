import 'package:flutter/material.dart';
import 'package:fringe_programme/models/event.dart';
import 'package:fringe_programme/programme_helper.dart';
import 'package:scoped_model/scoped_model.dart';

class EventPageModel extends Model {
  String searchTerm;
  List<String> genres;
  String entryType;
  String ageRestriction;
  DateTime dateTime;
  List<int> venueIDS;

  EventPageModel(this.searchTerm, this.genres, this.entryType,
      this.ageRestriction, this.dateTime, this.venueIDS);

  EventPageModel.zero()
      : searchTerm = "",
        genres = ProgrammeHelper.genres.keys.toList(),
        entryType = "Any",
        ageRestriction = "Any",
        dateTime = DateTime.now(),
        venueIDS = ProgrammeHelper.allVenues.map((v) => v.id).toList();

  void updateModel(
      {String searchTerm,
      List<String> genres,
      String entryType,
      String ageRestriction,
      String venue,
      DateTime dateTime,
      List<int> venueIDS}) {
    if (searchTerm != null) this.searchTerm = searchTerm;
    if (genres != null) this.genres = genres;
    if (entryType != null) this.entryType = entryType;
    if (ageRestriction != null) this.ageRestriction = ageRestriction;
    if (dateTime != null) this.dateTime = dateTime;
    if (venueIDS != null) this.venueIDS = venueIDS;
    notifyListeners();
  }

  void clearFilter() {
    this.searchTerm = EventPageModel.zero().searchTerm;
    this.genres = EventPageModel.zero().genres;
    this.entryType = EventPageModel.zero().entryType;
    this.ageRestriction = EventPageModel.zero().ageRestriction;
    this.dateTime = EventPageModel.zero().dateTime;
    this.venueIDS = EventPageModel.zero().venueIDS;
    notifyListeners();
  }

  List<Event> applyFilter(List<Event> events) {
    List<Event> filtered = events
      ..retainWhere((e) =>
          e.title.toLowerCase().contains(searchTerm.toLowerCase()) ||
          e.performer.toLowerCase().contains(searchTerm.toLowerCase()))
      ..retainWhere((e) {
        return genres.contains(e.genre);
      })
      ..retainWhere((e) {
        if (entryType == "Any") {
          return true;
        } else {
          return e.entryType == entryType;
        }
      })
      ..retainWhere((e) {
        if (ageRestriction == "Any") {
          return true;
        } else {
          return e.ageRestriction == ageRestriction;
        }
      })..retainWhere((e){
        return venueIDS.contains(ProgrammeHelper.getVenueFromName(e.venue).id);
      });
    return filtered;
  }

  static EventPageModel of(BuildContext context) => ScopedModel.of(context);
}
