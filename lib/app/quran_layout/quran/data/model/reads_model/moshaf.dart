import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'moshaf.g.dart';

@JsonSerializable()
class Moshaf extends Equatable {
  final int? id;
  final String? name;
  final String? server;
  @JsonKey(name: 'surah_total')
  final int? surahTotal;
  @JsonKey(name: 'moshaf_type')
  final int? moshafType;
  @JsonKey(name: 'surah_list')
  final List<int>? surahList;

  const Moshaf({
    this.id,
    this.name,
    this.server,
    this.surahTotal,
    this.moshafType,
    this.surahList,
  });

  factory Moshaf.fromJson(Map<String, dynamic> json) {
    return _$MoshafFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MoshafToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      name,
      server,
      surahTotal,
      moshafType,
      surahList,
    ];
  }
}
