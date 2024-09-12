// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ayat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AyatModel _$AyatModelFromJson(Map<String, dynamic> json) => AyatModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      transliteration: json['transliteration'] as String?,
      type: json['type'] as String?,
      totalVerses: (json['total_verses'] as num?)?.toInt(),
      verses: (json['verses'] as List<dynamic>?)
          ?.map((e) => Verse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AyatModelToJson(AyatModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'transliteration': instance.transliteration,
      'type': instance.type,
      'total_verses': instance.totalVerses,
      'verses': instance.verses,
    };
