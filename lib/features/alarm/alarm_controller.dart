import 'dart:io';

import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../../helper/alarm_service.dart';
import '../../helper/notification_helper.dart';
import 'data/alarm_model.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AlarmController extends GetxController {
  final AlarmService _alarmService = AlarmService();
  final NotificationService _notificationService = NotificationService();

  /// Reactive list of alarms
  var alarms = <Alarm>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Android 12+ exact alarm permission
    if (Platform.isAndroid) {
      final androidPlugin = _notificationService.flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();

      if (androidPlugin != null) {
        // Request exact alarm permission (Android 12+)
        androidPlugin.requestExactAlarmsPermission();

        // Request notification permission (Android 13+)
        androidPlugin.requestNotificationsPermission();
      }
    }
    loadAlarms();
  }

  /// Load all alarms from Hive
  Future<void> loadAlarms() async {
    alarms.value = await _alarmService.getAlarms();
  }

  /// Add a new alarm
  Future<void> addAlarm(DateTime time) async {
    final alarm = Alarm(
      id: const Uuid().v4(), // unique id
      time: time,
      isActive: true,
    );

    await _alarmService.addAlarm(alarm);
    await _notificationService.scheduleAlarm(alarm);
    await loadAlarms();
  }

  /// Toggle alarm on/off
  Future<void> toggleAlarm(Alarm alarm) async {
    alarm.isActive = !alarm.isActive;

    await _alarmService.updateAlarm(alarm);

    if (alarm.isActive) {
      await _notificationService.scheduleAlarm(alarm);
    } else {
      await _notificationService.cancelAlarm(alarm);
    }

    await loadAlarms();
  }

  /// Delete an alarm
  Future<void> deleteAlarm(Alarm alarm) async {
    await _alarmService.deleteAlarm(alarm.id);
    await _notificationService.cancelAlarm(alarm);
    await loadAlarms();
  }
}
