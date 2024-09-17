import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'surah_model.g.dart';

@JsonSerializable()
class SurahModel extends Equatable {
  final List<Datum>? data;

  const SurahModel({this.data});

  factory SurahModel.fromJson(Map<String, dynamic> json) {
    return _$SurahModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SurahModelToJson(this);

  @override
  List<Object?> get props => [data];
}
