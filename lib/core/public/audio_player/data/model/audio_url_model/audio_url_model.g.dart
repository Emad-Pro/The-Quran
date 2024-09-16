// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_url_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioUrlModel _$AudioUrlModelFromJson(Map<String, dynamic> json) =>
    AudioUrlModel(
      code: (json['code'] as num?)?.toInt(),
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AudioUrlModelToJson(AudioUrlModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };
