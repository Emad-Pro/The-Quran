import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'surah_play_model.g.dart';

@JsonSerializable()
class SurahPlayModel extends Equatable {
  final int? id;
  final String? name;
  final String? server;
  final int? surahTotal;
  final int? moshafType;

  const SurahPlayModel({
    this.id,
    this.name,
    this.server,
    this.surahTotal,
    this.moshafType,
  });

  factory SurahPlayModel.fromJson(Map<String, dynamic> json) {
    return _$SurahPlayModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SurahPlayModelToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      name,
      server,
      surahTotal,
      moshafType,
    ];
  }
}
