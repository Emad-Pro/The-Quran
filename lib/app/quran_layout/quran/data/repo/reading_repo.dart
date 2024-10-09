import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:the_quran/app/quran_layout/quran/data/model/reads_model/reads_model.dart';

class ReadingRepo {
  Future<ReadsModel> loadReading() async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/json/reads_list/reads.json');
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);
      return ReadsModel.fromJson(jsonData);
    } catch (e) {
      print(e.toString());
      throw Exception('Error loading JSON: $e');
    }
  }
}
