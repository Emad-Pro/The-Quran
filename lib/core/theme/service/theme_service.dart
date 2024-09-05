import 'package:flutter/material.dart';

import '../../bloc_cache/cache_service.dart';

class ThemeService {
  static ThemeData lightTheme(Locale locale) => ThemeData(
        brightness: Brightness.light,
        fontFamily: locale.languageCode == 'ar' ? 'nato_kufe' : 'noto_serif',
        drawerTheme: const DrawerThemeData(),
      );

  static ThemeData darkTheme(Locale locale) =>
      ThemeData(brightness: Brightness.dark);
  // var Key Theme
  static const String _themeKey = 'theme_key';

  // toggle Theme Var
  static bool isDarkTheme = false;
  // load themeing
  static void loadTheme() async {
    final theme = await StorageHelper().getData(_themeKey);
    if (theme == "dark") {
      isDarkTheme = true;
    } else {
      isDarkTheme = false;
    }
  }

  static ThemeMode themeApp() => isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  // toggle themeing
  static void toggleTheme(String themeValue) async {
    if (themeValue == "dark") {
      isDarkTheme = true;
    } else {
      isDarkTheme = false;
    }
    await StorageHelper().saveData(_themeKey, themeValue);
  }
}
