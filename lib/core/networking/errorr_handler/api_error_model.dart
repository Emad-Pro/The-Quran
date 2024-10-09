import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final int? code;
  @JsonKey(name: 'data')
  final Map<String, dynamic>? errors;

  ApiErrorModel({
    this.message,
    this.code,
    this.errors,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  /// Returns a String containing all error messages.
  String getAllErrorMessages() {
    if (errors.isNullOrEmpty()) return message ?? "Unknown error occurred";

    final errorMessages = errors!.entries.map((entry) {
      final value = entry.value;
      if (value is List) {
        return value.join(', ');
      } else {
        return value.toString();
      }
    }).join('\n');

    return errorMessages;
  }
}

extension MapExtension<K, V> on Map<K, V>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}
