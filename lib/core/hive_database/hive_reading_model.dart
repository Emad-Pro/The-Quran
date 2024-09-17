import 'package:hive/hive.dart';

part 'hive_reading_model.g.dart';

@HiveType(typeId: 0)
class HiveReadingModel extends HiveObject {
  @HiveField(0)
  final int? lastSurah;

  @HiveField(1)
  final int? lastAyah;

  @HiveField(2)
  final bool? isJuze;

  @HiveField(3)
  final int? lastJuze;

  @HiveField(4)
  final double? lastPositionSaved;

  HiveReadingModel({
    this.lastSurah,
    this.lastAyah,
    this.isJuze,
    this.lastJuze,
    this.lastPositionSaved,
  });
}
