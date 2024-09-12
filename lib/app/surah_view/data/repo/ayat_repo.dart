import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/ayat_model/ayat_model.dart';

class AyatRepo {
  // تحميل ملف JSON من assets
  Future<AyatModel> loadSurah(int id) async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/json/quran_surahs/$id.json');
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);
      return AyatModel.fromJson(jsonData);
    } catch (e) {
      throw Exception('Error loading JSON: $e');
    }
  }
}
