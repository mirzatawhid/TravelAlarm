import 'package:hive/hive.dart';

part 'alarm_model.g.dart';

@HiveType(typeId: 0)
class Alarm extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  DateTime time;

  @HiveField(2)
  bool isActive;

  Alarm({
    required this.id,
    required this.time,
    this.isActive = true,
  });
}
