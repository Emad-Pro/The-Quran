import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:the_quran/app/quran_layout/quran/data/model/surah_model/surah_model.dart';

class SurahRepo {
  Future<SurahModel> loadSuwer() async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/json/suar/suar.json');
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);
      return SurahModel.fromJson(jsonData);
    } catch (e) {
      throw Exception('Error loading JSON: $e');
    }
  }
}
