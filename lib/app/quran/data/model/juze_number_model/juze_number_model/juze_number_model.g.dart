// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'juze_number_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JuzeNumberModel _$JuzeNumberModelFromJson(Map<String, dynamic> json) =>
    JuzeNumberModel(
      quranJuze: (json['quran_juze'] as List<dynamic>?)
          ?.map((e) => QuranJuze.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$JuzeNumberModelToJson(JuzeNumberModel instance) =>
    <String, dynamic>{
      'quran_juze': instance.quranJuze,
    };
