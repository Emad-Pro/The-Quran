import 'package:flutter/material.dart';

import '../../bloc_cache/cache_service.dart';

class ThemeService {
  static const String _themeKey = 'theme_key';
  static bool isDarkTheme = false;

  // تحميل الثيم من التخزين
  static Future<void> loadTheme() async {
    final theme = await StorageHelper().getData(_themeKey);
    isDarkTheme = theme == "dark";
  }

  // تحديد الوضع الحالي للتطبيق
  static ThemeMode themeApp() => isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  // تبديل الثيم وحفظه في التخزين
  static Future<void> toggleTheme(String themeValue) async {
    isDarkTheme = themeValue == "dark";
    await StorageHelper().saveData(_themeKey, themeValue);
  }

  // جلب الثيم المناسب (مضيء أو مظلم)
  static ThemeData lightTheme(Locale locale) => ThemeData(
        brightness: Brightness.light,
        drawerTheme: const DrawerThemeData(),
      );

  static ThemeData darkTheme(Locale locale) =>
      ThemeData(brightness: Brightness.dark);
}
