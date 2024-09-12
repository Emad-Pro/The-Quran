import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quran_hizb.g.dart';

@JsonSerializable()
class QuranHizb extends Equatable {
  @JsonKey(name: 'hizb_number')
  final num? hizbNumber;
  final String? name;
  final String? translation;

  const QuranHizb({this.hizbNumber, this.name, this.translation});

  factory QuranHizb.fromJson(Map<String, dynamic> json) {
    return _$QuranHizbFromJson(json);
  }

  Map<String, dynamic> toJson() => _$QuranHizbToJson(this);

  @override
  List<Object?> get props => [hizbNumber, name, translation];
}
