import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fringe_programme/models/event.dart';
import 'package:rapido/rapido.dart';

class DatabaseHelper {
  static DocumentList _eventList = DocumentList("events")..clear();

  static DocumentList get eventList => _eventList;
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();

  static List<String> getSavedEvents() {
    List<String> events = [];
    for (int i = 0; i < _eventList.length; i++) {
      events.add(_eventList[i]["id"]);
    }
    return events;
  }

  static void addEvent(String eventID) {
    if (!getSavedEvents().contains(eventID)) {
      _eventList
          .add(Document(initialValues: {"id": eventID, "notification": null}));
    }
  }

  static DateTime getNotificationTime(String eventID) {
    int mills = _eventList.firstWhere((d) => d.containsValue(eventID))["notification"];
    if (mills != null) {
      return DateTime.fromMillisecondsSinceEpoch(_eventList
          .firstWhere((d) => d.containsValue(eventID))["notification"]);
    } else {
      return null;
    }
  }

  static void deleteNotification(String eventID) {
    _eventList.firstWhere((d) => d.containsValue(eventID))["notification"] = 0;
    flutterLocalNotificationsPlugin.cancel(eventIDToNotificationID(eventID));
  }

  static void addNotification(String eventID, int notificationTime, Event event) async {
    _eventList.firstWhere((d) => d.containsValue(eventID))["notification"] = notificationTime;
    var scheduledNotificationDateTime = new DateTime.fromMillisecondsSinceEpoch(notificationTime);
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'shaftesbury.fringe.event.notification',
        'Shaftesbury Fringe Events',
        'Event Notifications');
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    NotificationDetails platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.schedule(
        eventIDToNotificationID(eventID),
        '${event.title} is starting soon',
        '${DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(notificationTime)).inMinutes.abs()} minutes at ${event.venue}',
        scheduledNotificationDateTime,
        platformChannelSpecifics, payload: eventID);
  }

  static bool containsEvent(String eventID) =>
      getSavedEvents().contains(eventID);

  static void removeEvent(String eventID) {
    for (int i = 0; i < _eventList.length; i++) {
      if (_eventList[i].containsValue(eventID)) {
        _eventList.removeAt(i);
      }
    }
  }

  static void clearList() => _eventList.clear();

  static int eventIDToNotificationID(String eventID) {
    String end = eventID.split("-")[1];
    bool numberAtEnd =
        int.tryParse(end.substring(end.length - 1)) == null ?? true;
    return int.parse(
        "9${end.substring(0, numberAtEnd ? end.length - 1 : end.length).padLeft(3, "0")}9${numberAtEnd ? (end.substring(end.length - 1).runes.single - 96).toString().padLeft(2, "0") : "00"}");
  }

  static String notificationIDToEventID(int notificationID) {
    List<String> split = notificationID.toString().split("9");
    if (split[2] == "00") {
      return "1-${int.tryParse(split[1])}";
    } else {
      return "1-${int.tryParse(split[1])}${String.fromCharCode(int.tryParse(split[2]) + 96)}";
    }
  }
}
