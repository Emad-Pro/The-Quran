// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_reading_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveReadingModelAdapter extends TypeAdapter<HiveReadingModel> {
  @override
  final int typeId = 0;

  @override
  HiveReadingModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveReadingModel(
      lastSurah: fields[0] as int?,
      lastAyah: fields[1] as int?,
      isJuze: fields[2] as bool?,
      lastJuze: fields[3] as int?,
      lastPositionSaved: fields[4] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveReadingModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.lastSurah)
      ..writeByte(1)
      ..write(obj.lastAyah)
      ..writeByte(2)
      ..write(obj.isJuze)
      ..writeByte(3)
      ..write(obj.lastJuze)
      ..writeByte(4)
      ..write(obj.lastPositionSaved);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveReadingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
