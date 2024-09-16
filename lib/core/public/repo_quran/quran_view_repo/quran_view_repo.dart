import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/quran_view_model/quran_view_model.dart';

class QuranViewRepo {
  static List<QuranViewModel> allQuran = [];

  Future<List<QuranViewModel>> loadQuranData() async {
    // إذا كانت البيانات قد تم تحميلها مسبقًا، لا تقم بتحميلها مرة أخرى
    if (allQuran.isNotEmpty) {
      return allQuran;
    }
    final String response =
        await rootBundle.loadString('assets/json/hafs.json');

    final List<dynamic> jsonData = json.decode(response);
    allQuran = jsonData.map((data) => QuranViewModel.fromJson(data)).toList();
    return allQuran;
  }

  Future<List<QuranViewModel>> load({int? juzzNumber, int? ayahNumber}) async {
    List<QuranViewModel> quranData = await loadQuranData();

    List<QuranViewModel> filteredData = [];
    if (juzzNumber != null) {
      filteredData = quranData.where((aya) {
        return aya.jozz == juzzNumber;
      }).toList();
    } else {
      filteredData = quranData.where((aya) {
        return aya.suraNo == juzzNumber;
      }).toList();
    }

    return filteredData;
  }

  Future<List<QuranViewModel>> loadSurah({required int? surahId}) async {
    List<QuranViewModel> quranData = await loadQuranData();

    List<QuranViewModel> filteredData = [];

    filteredData = quranData.where((aya) {
      return aya.suraNo == surahId;
    }).toList();

    return filteredData;
  }
}
