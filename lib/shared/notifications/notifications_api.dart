// ignore_for_file: prefer_const_constructors

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationApi {
  static final _notification = FlutterLocalNotificationsPlugin();
  static final onNotification = BehaviorSubject<String?>();

  static initNotification({bool initScheduled = false}) async {
    try {
      final android = AndroidInitializationSettings('@mipmap/ic_launcher');
      final ios = IOSInitializationSettings();
      final InitializationSettings Settings = InitializationSettings(
        android: android,
        iOS: ios,
      );
      await _notification.initialize(
        Settings,
        onSelectNotification: (payload) {
          if (payload != null) {
            print('notification payload: ${payload}');
          }
          onNotification.add(payload);
        },
      );
      if (initScheduled) {
        tz.initializeTimeZones();
        final locationName = await FlutterNativeTimezone.getLocalTimezone();
        tz.setLocalLocation(tz.getLocation(locationName));
      }
    } catch (error) {
      print(error.toString());
    }
  }

  static Future _notificationDetails() async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id1',
        'channel name',
        channelDescription: 'channel description',
        importance: Importance.max,
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payLoad,
  }) async {
    try {
      _notification.show(
        id,
        title,
        body,
        await _notificationDetails(),
        payload: payLoad,
      );
    } catch (error) {
      print(error.toString());
    }
  }

  static Future showScheduledNotification({
    int id = 0,
    String? title,
    String? body,
    String? payLoad,
    required DateTime scheduleDate,
  }) async {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.local);
    try {
      _notification.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(scheduleDate, tz.local),
        await _notificationDetails(),
        payload: payLoad,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dateAndTime,
      );
    } catch (error) {
      print(error.toString());
    }
  }
}
