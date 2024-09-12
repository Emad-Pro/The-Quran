import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/juze_number_model/juze_number_model/juze_number_model.dart';

class JuzeRepo {
  Future<JuzeNumberModel> loadJuze() async {
    try {
      final jsonString = await rootBundle
          .loadString('assets/json/juz_numbers/juze_number.json');
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);
      return JuzeNumberModel.fromJson(jsonData);
    } catch (e) {
      throw Exception('Error loading JSON: $e');
    }
  }
}
