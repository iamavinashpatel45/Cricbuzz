import 'package:cricket/login/account.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class fun_notification {
  static var notification = FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    var androidIni = new AndroidInitializationSettings("icon");
    var isoIni = new IOSInitializationSettings();
    var settingIni =
        new InitializationSettings(android: androidIni, iOS: isoIni);
    notification = new FlutterLocalNotificationsPlugin();
    notification.initialize(settingIni,
        onSelectNotification: notificationselected());
  }

  static notificationselected() {}

  static Future details() async {
    return NotificationDetails(
        android: AndroidNotificationDetails(
      'Avinash PAtel',
      'Avi',
      importance: Importance.max,
    ));
  }

  static shownotificatio(
      {int id = 0, String? title, String? body, DateTime? date}) async {
    notification.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(date!, tz.local).add(Duration(seconds: 15)),
        await details(),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }

  static setnotification(String name, String date_1) async {
    await init();
    DateTime date = DateTime.parse(date_1);
    shownotificatio(id: 0, title: "Reminder", body: name, date: date);
  }
}
