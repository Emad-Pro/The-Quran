import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'audio_url_model.g.dart';

@JsonSerializable()
class AudioUrlModel extends Equatable {
  final int? code;
  final String? status;
  final Data? data;

  const AudioUrlModel({this.code, this.status, this.data});

  factory AudioUrlModel.fromJson(Map<String, dynamic> json) {
    return _$AudioUrlModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AudioUrlModelToJson(this);

  @override
  List<Object?> get props => [code, status, data];
}
