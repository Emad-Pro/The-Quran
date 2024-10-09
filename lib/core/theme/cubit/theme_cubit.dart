import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../service/theme_service.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState()) {
    _initializeTheme();
  }

  // Initialize theme by loading from ThemeService
  void _initializeTheme() async {
    await ThemeService.loadTheme(); // Await the loadTheme to complete
    final isDarkTheme = ThemeService.isDarkTheme;
    emit(state.copyWith(
      themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
    ));
  }

  // Toggle theme
  void toggleTheme() async {
    if (state.themeMode == ThemeMode.light) {
      await ThemeService.toggleTheme("dark"); // Await theme toggle
      emit(state.copyWith(themeMode: ThemeMode.dark));
    } else {
      await ThemeService.toggleTheme("light"); // Await theme toggle
      emit(state.copyWith(themeMode: ThemeMode.light));
    }
  }
}
