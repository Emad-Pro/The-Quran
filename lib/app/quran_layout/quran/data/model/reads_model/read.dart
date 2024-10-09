import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'moshaf.dart';

part 'read.g.dart';

@JsonSerializable()
class Read extends Equatable {
  final int? id;
  final String? name;
  final String? letter;
  @JsonKey(name: 'recent_date')
  final DateTime? recentDate;
  final List<Moshaf>? moshaf;

  const Read({
    this.id,
    this.name,
    this.letter,
    this.recentDate,
    this.moshaf,
  });

  factory Read.fromJson(Map<String, dynamic> json) => _$ReadFromJson(json);

  Map<String, dynamic> toJson() => _$ReadToJson(this);

  @override
  List<Object?> get props => [id, name, letter, recentDate, moshaf];
}
