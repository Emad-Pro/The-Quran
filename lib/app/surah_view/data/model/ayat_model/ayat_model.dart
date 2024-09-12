import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'verse.dart';

part 'ayat_model.g.dart';

@JsonSerializable()
class AyatModel extends Equatable {
  final int? id;
  final String? name;
  final String? transliteration;
  final String? type;
  @JsonKey(name: 'total_verses')
  final int? totalVerses;
  final List<Verse>? verses;

  const AyatModel({
    this.id,
    this.name,
    this.transliteration,
    this.type,
    this.totalVerses,
    this.verses,
  });

  factory AyatModel.fromJson(Map<String, dynamic> json) {
    return _$AyatModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AyatModelToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      name,
      transliteration,
      type,
      totalVerses,
      verses,
    ];
  }
}
