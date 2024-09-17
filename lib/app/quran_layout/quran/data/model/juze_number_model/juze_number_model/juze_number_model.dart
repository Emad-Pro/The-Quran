import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'quran_juze.dart';

part 'juze_number_model.g.dart';

@JsonSerializable()
class JuzeNumberModel extends Equatable {
  @JsonKey(name: 'quran_juze')
  final List<QuranJuze>? quranJuze;

  const JuzeNumberModel({this.quranJuze});

  factory JuzeNumberModel.fromJson(Map<String, dynamic> json) {
    return _$JuzeNumberModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$JuzeNumberModelToJson(this);

  @override
  List<Object?> get props => [quranJuze];
}
