import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:the_quran/app/quran/data/model/hizb_number_model/hizb_number_model/hizb_number_model.dart';

class HizbRepo {
  Future<HizbNumberModel> loadHizb() async {
    try {
      final jsonString = await rootBundle
          .loadString('assets/json/hizb_number/hizb_number.json');
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);
      return HizbNumberModel.fromJson(jsonData);
    } catch (e) {
      throw Exception('Error loading JSON: $e');
    }
  }
}
