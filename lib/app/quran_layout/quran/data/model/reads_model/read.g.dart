// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Read _$ReadFromJson(Map<String, dynamic> json) => Read(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      letter: json['letter'] as String?,
      recentDate: json['recent_date'] == null
          ? null
          : DateTime.parse(json['recent_date'] as String),
      moshaf: (json['moshaf'] as List<dynamic>?)
          ?.map((e) => Moshaf.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReadToJson(Read instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'letter': instance.letter,
      'recent_date': instance.recentDate?.toIso8601String(),
      'moshaf': instance.moshaf,
    };
