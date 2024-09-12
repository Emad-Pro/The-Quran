// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuranPageModel _$QuranPageModelFromJson(Map<String, dynamic> json) =>
    QuranPageModel(
      id: json['id'] as num?,
      jozz: json['jozz'] as num?,
      page: json['page'] as num?,
      suraNo: json['sura_no'] as num?,
      suraNameEn: json['sura_name_en'] as String?,
      suraNameAr: json['sura_name_ar'] as String?,
      lineStart: json['line_start'] as num?,
      lineEnd: json['line_end'] as num?,
      ayaNo: json['aya_no'] as num?,
      ayaText: json['aya_text'] as String?,
      ayaTextEmlaey: json['aya_text_emlaey'] as String?,
    );

Map<String, dynamic> _$QuranPageModelToJson(QuranPageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jozz': instance.jozz,
      'page': instance.page,
      'sura_no': instance.suraNo,
      'sura_name_en': instance.suraNameEn,
      'sura_name_ar': instance.suraNameAr,
      'line_start': instance.lineStart,
      'line_end': instance.lineEnd,
      'aya_no': instance.ayaNo,
      'aya_text': instance.ayaText,
      'aya_text_emlaey': instance.ayaTextEmlaey,
    };
