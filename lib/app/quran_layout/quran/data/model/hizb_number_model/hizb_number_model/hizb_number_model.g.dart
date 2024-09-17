// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hizb_number_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HizbNumberModel _$HizbNumberModelFromJson(Map<String, dynamic> json) =>
    HizbNumberModel(
      quranHizb: (json['quran_hizb'] as List<dynamic>?)
          ?.map((e) => QuranHizb.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HizbNumberModelToJson(HizbNumberModel instance) =>
    <String, dynamic>{
      'quran_hizb': instance.quranHizb,
    };
