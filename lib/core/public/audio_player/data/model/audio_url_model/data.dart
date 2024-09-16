import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'edition.dart';
import 'surah.dart';

part 'data.g.dart';

@JsonSerializable()
class Data extends Equatable {
  final int? number;
  final String? audio;
  final List<String>? audioSecondary;
  final String? text;
  final Edition? edition;
  final Surah? surah;
  final int? numberInSurah;
  final int? juz;
  final int? manzil;
  final int? page;
  final int? ruku;
  final int? hizbQuarter;
  final bool? sajda;

  const Data({
    this.number,
    this.audio,
    this.audioSecondary,
    this.text,
    this.edition,
    this.surah,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  List<Object?> get props {
    return [
      number,
      audio,
      audioSecondary,
      text,
      edition,
      surah,
      numberInSurah,
      juz,
      manzil,
      page,
      ruku,
      hizbQuarter,
      sajda,
    ];
  }
}
