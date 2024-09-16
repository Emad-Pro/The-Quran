import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'surah.g.dart';

@JsonSerializable()
class Surah extends Equatable {
  final int? number;
  final String? name;
  final String? englishName;
  final String? englishNameTranslation;
  final int? numberOfAyahs;
  final String? revelationType;

  const Surah({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.numberOfAyahs,
    this.revelationType,
  });

  factory Surah.fromJson(Map<String, dynamic> json) => _$SurahFromJson(json);

  Map<String, dynamic> toJson() => _$SurahToJson(this);

  @override
  List<Object?> get props {
    return [
      number,
      name,
      englishName,
      englishNameTranslation,
      numberOfAyahs,
      revelationType,
    ];
  }
}
