import 'package:fringe_programme/models/event.dart';
import 'package:fringe_programme/programme_helper.dart';
import 'package:scoped_model/scoped_model.dart';

class EventPageModel extends Model {
  String searchTerm;
  List<String> genres;
  String entryType;
  String ageRestriction;
  int venue;

  EventPageModel(this.searchTerm, this.genres, this.entryType,
      this.ageRestriction, this.venue);

  EventPageModel.zero()
      : searchTerm = "",
        genres = ProgrammeHelper.genres.keys.toList(),
        entryType = "Any",
        ageRestriction = "Any",
        venue = -1;

  void updateModel(
      {String searchTerm,
      List<String> genres,
      String entryType,
      String ageRestriction,
      int venue}) {
    if (searchTerm != null) this.searchTerm = searchTerm;
    if (genres != null) this.genres = genres;
    if (entryType != null) this.entryType = entryType;
    if (ageRestriction != null) this.ageRestriction = ageRestriction;
    if (venue != null) this.venue = venue;
    notifyListeners();
  }

  void clearFilter() {
    this.searchTerm = EventPageModel.zero().searchTerm;
    this.genres = EventPageModel.zero().genres;
    this.entryType = EventPageModel.zero().entryType;
    this.ageRestriction = EventPageModel.zero().ageRestriction;
    this.venue = EventPageModel.zero().venue;
    notifyListeners();
  }

  List<Event> applyFilter(List<Event> events) {
    List<Event> filtered = events
      ..retainWhere(
          (e) => e.title.toLowerCase().contains(searchTerm.toLowerCase()))
      ..retainWhere((e) {
        if (venue == -1) {
          return true;
        } else {
          return e.venue == venue;
        }
      })
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
      });
    return filtered;
  }
}
