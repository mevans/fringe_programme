import 'package:rapido/rapido.dart';

class DatabaseHelper {
  static DocumentList _eventList = DocumentList("events");

  static DocumentList get eventList => _eventList;

  static List<String> getSavedEvents() {
    List<String> events = [];
    for (int i = 0; i < _eventList.length; i++) {
      events.add(_eventList[i]["id"]);
    }
    return events;
  }

  static void addEvent(String eventID) {
    if (!getSavedEvents().contains(eventID)) {
      _eventList.add(Document(initialValues: {"id": eventID}));
    }
  }

  static bool containsEvent(String eventID) => getSavedEvents().contains(eventID);
  static void removeEvent(String eventID) {
    for (int i = 0; i < _eventList.length; i++) {
      if (_eventList[i].containsValue(eventID)) {
        _eventList.removeAt(i);
      }
    }
  }
  static void clearList() => _eventList.clear();
}
