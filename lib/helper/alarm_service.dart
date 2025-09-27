import 'package:hive/hive.dart';

import '../features/alarm/data/alarm_model.dart';

class AlarmService {
  static const String _boxName = "alarmsBox";

  Future<Box<Alarm>> _openBox() async {
    return await Hive.openBox<Alarm>(_boxName);
  }

  Future<List<Alarm>> getAlarms() async {
    final box = await _openBox();
    return box.values.toList();
  }

  Future<void> addAlarm(Alarm alarm) async {
    final box = await _openBox();
    await box.put(alarm.id, alarm);
  }

  Future<void> updateAlarm(Alarm alarm) async {
    final box = await _openBox();
    await box.put(alarm.id, alarm);
  }

  Future<void> deleteAlarm(String id) async {
    final box = await _openBox();
    await box.delete(id);
  }
}
