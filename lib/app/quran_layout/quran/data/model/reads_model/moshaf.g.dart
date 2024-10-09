// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moshaf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Moshaf _$MoshafFromJson(Map<String, dynamic> json) {
  var surahListData = json['surah_list'];
  List<int> surahListParsed;

  if (surahListData is String) {
    // إذا كانت السلسلة تحتوي على الأرقام مفصولة بفواصل، نقوم بتقسيمها وتحويلها إلى قائمة من الأرقام
    surahListParsed =
        surahListData.split(',').map((e) => int.parse(e)).toList();
  } else {
    // إذا كانت قائمة بالفعل
    surahListParsed = List<int>.from(surahListData);
  }

  return Moshaf(
    id: json['id'] as int,
    name: json['name'] as String,
    server: json['server'] as String,
    surahTotal: json['surah_total'] as int,
    moshafType: json['moshaf_type'] as int,
    surahList: surahListParsed,
  );
}

Map<String, dynamic> _$MoshafToJson(Moshaf instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'server': instance.server,
      'surah_total': instance.surahTotal,
      'moshaf_type': instance.moshafType,
      'surah_list': instance.surahList,
    };
