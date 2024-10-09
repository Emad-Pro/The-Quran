// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reads_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReadsModel _$ReadsModelFromJson(Map<String, dynamic> json) => ReadsModel(
      reads: (json['reads'] as List<dynamic>?)
          ?.map((e) => Read.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReadsModelToJson(ReadsModel instance) =>
    <String, dynamic>{
      'reads': instance.reads,
    };
