import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'quran_hizb.dart';

part 'hizb_number_model.g.dart';

@JsonSerializable()
class HizbNumberModel extends Equatable {
  @JsonKey(name: 'quran_hizb')
  final List<QuranHizb>? quranHizb;

  const HizbNumberModel({this.quranHizb});

  factory HizbNumberModel.fromJson(Map<String, dynamic> json) {
    return _$HizbNumberModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HizbNumberModelToJson(this);

  @override
  List<Object?> get props => [quranHizb];
}
