import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verse.g.dart';

@JsonSerializable()
class Verse extends Equatable {
  final int? id;
  final String? text;
  final String? transliteration;

  const Verse({this.id, this.text, this.transliteration});

  factory Verse.fromJson(Map<String, dynamic> json) => _$VerseFromJson(json);

  Map<String, dynamic> toJson() => _$VerseToJson(this);

  @override
  List<Object?> get props => [id, text, transliteration];
}
