// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Verse _$VerseFromJson(Map<String, dynamic> json) => Verse(
      id: (json['id'] as num?)?.toInt(),
      text: json['text'] as String?,
      transliteration: json['transliteration'] as String?,
    );

Map<String, dynamic> _$VerseToJson(Verse instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'transliteration': instance.transliteration,
    };
