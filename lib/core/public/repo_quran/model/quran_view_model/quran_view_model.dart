import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quran_view_model.g.dart';

@JsonSerializable()
class QuranViewModel extends Equatable {
  final num? id;
  final num? jozz;
  final num? page;
  @JsonKey(name: 'sura_no')
  final num? suraNo;
  @JsonKey(name: 'sura_name_en')
  final String? suraNameEn;
  @JsonKey(name: 'sura_name_ar')
  final String? suraNameAr;
  @JsonKey(name: 'line_start')
  final num? lineStart;
  @JsonKey(name: 'line_end')
  final num? lineEnd;
  @JsonKey(name: 'aya_no')
  final num? ayaNo;
  @JsonKey(name: 'aya_text')
  final String? ayaText;
  @JsonKey(name: 'aya_text_emlaey')
  final String? ayaTextEmlaey;

  const QuranViewModel({
    this.id,
    this.jozz,
    this.page,
    this.suraNo,
    this.suraNameEn,
    this.suraNameAr,
    this.lineStart,
    this.lineEnd,
    this.ayaNo,
    this.ayaText,
    this.ayaTextEmlaey,
  });

  factory QuranViewModel.fromJson(Map<String, dynamic> json) {
    return _$QuranViewModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$QuranViewModelToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      jozz,
      page,
      suraNo,
      suraNameEn,
      suraNameAr,
      lineStart,
      lineEnd,
      ayaNo,
      ayaText,
      ayaTextEmlaey,
    ];
  }
}
