import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'read.dart';

part 'reads_model.g.dart';

@JsonSerializable()
class ReadsModel extends Equatable {
  final List<Read>? reads;

  const ReadsModel({this.reads});

  factory ReadsModel.fromJson(Map<String, dynamic> json) {
    return _$ReadsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReadsModelToJson(this);

  @override
  List<Object?> get props => [reads];
}
