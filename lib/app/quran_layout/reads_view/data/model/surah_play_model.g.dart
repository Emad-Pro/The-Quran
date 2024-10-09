// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surah_play_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurahPlayModel _$SurahPlayModelFromJson(Map<String, dynamic> json) =>
    SurahPlayModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      server: json['server'] as String?,
      surahTotal: (json['surahTotal'] as num?)?.toInt(),
      moshafType: (json['moshafType'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SurahPlayModelToJson(SurahPlayModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'server': instance.server,
      'surahTotal': instance.surahTotal,
      'moshafType': instance.moshafType,
    };
