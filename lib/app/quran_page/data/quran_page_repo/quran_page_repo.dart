import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/quran_page_model/quran_page_model.dart';

class QuranPageRepo {
  static List<QuranPageModel> allQuran = [];

  Future<List<QuranPageModel>> loadQuranData() async {
    // إذا كانت البيانات قد تم تحميلها مسبقًا، لا تقم بتحميلها مرة أخرى
    if (allQuran.isNotEmpty) {
      return allQuran;
    }
    final String response =
        await rootBundle.loadString('assets/json/hafs.json');

    final List<dynamic> jsonData = json.decode(response);
    allQuran = jsonData.map((data) => QuranPageModel.fromJson(data)).toList();
    return allQuran;
  }

  Future<List<QuranPageModel>> load({int? juzzNumber, int? ayahNumber}) async {
    List<QuranPageModel> quranData = await loadQuranData();

    List<QuranPageModel> filteredData = [];
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
}
