import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'edition.g.dart';

@JsonSerializable()
class Edition extends Equatable {
  final String? identifier;
  final String? language;
  final String? name;
  final String? englishName;
  final String? format;
  final String? type;
  final dynamic direction;

  const Edition({
    this.identifier,
    this.language,
    this.name,
    this.englishName,
    this.format,
    this.type,
    this.direction,
  });

  factory Edition.fromJson(Map<String, dynamic> json) {
    return _$EditionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EditionToJson(this);

  @override
  List<Object?> get props {
    return [
      identifier,
      language,
      name,
      englishName,
      format,
      type,
      direction,
    ];
  }
}
