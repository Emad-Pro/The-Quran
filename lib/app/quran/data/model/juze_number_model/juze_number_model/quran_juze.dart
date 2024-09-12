import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quran_juze.g.dart';

@JsonSerializable()
class QuranJuze extends Equatable {
  @JsonKey(name: 'juze_number')
  final num? juzeNumber;
  final String? name;
  final String? translation;

  const QuranJuze({this.juzeNumber, this.name, this.translation});

  factory QuranJuze.fromJson(Map<String, dynamic> json) {
    return _$QuranJuzeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$QuranJuzeToJson(this);

  @override
  List<Object?> get props => [juzeNumber, name];
}
