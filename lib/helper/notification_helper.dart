import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../features/alarm/data/alarm_model.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() => _instance;

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  NotificationService._internal() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  }

  Future<void> init() async {
    // Initialize timezone
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.local);

    // Android settings
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const settings = InitializationSettings(android: androidSettings);

    await flutterLocalNotificationsPlugin.initialize(settings);
    // Android 12+ exact alarm permission
    if (Platform.isAndroid) {
      final androidPlugin = flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
      >();

      if (androidPlugin != null) {
        // Request exact alarm permission (Android 12+)
        await androidPlugin.requestExactAlarmsPermission();

        // Request notification permission (Android 13+)
        await androidPlugin.requestNotificationsPermission();
      }
    }
  }

  Future<void> scheduleAlarm(Alarm alarm) async {
    final alarmId = alarm.id.hashCode; // ensure int ID

    await flutterLocalNotificationsPlugin.zonedSchedule(
      alarmId,
      "Alarm",
      'Alarm ringing at ${alarm.time}!',
      tz.TZDateTime.from(alarm.time, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'alarm_channel',
          'Alarms',
          channelDescription: 'Alarm notifications',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
        ),
      ),
      matchDateTimeComponents: DateTimeComponents.time, // repeat daily
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  Future<void> cancelAlarm(Alarm alarm) async {
    await flutterLocalNotificationsPlugin.cancel(alarm.id.hashCode);
  }
}
