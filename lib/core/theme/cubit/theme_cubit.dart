import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../service/theme_service.dart';

part 'theme_state.dart';
part 'theme_cubit.freezed.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState.light()) {
    _initializeTheme();
  }

  // Initialize theme by loading from ThemeService
  void _initializeTheme() async {
    ThemeService.loadTheme();
    final isDarkTheme =
        ThemeService.isDarkTheme; // Assuming ThemeService has this property
    if (isDarkTheme) {
      emit(const ThemeState.dark());
    } else {
      emit(const ThemeState.light());
    }
  }

  // Toggle theme
  void toggleTheme() async {
    if (state is _LightTheme) {
      ThemeService.toggleTheme("dark");
      emit(const ThemeState.dark());
    } else {
      ThemeService.toggleTheme("light");
      emit(const ThemeState.light());
    }
  }

  // Get ThemeData based on the current state
  ThemeData get themeData {
    return state is _LightTheme ? ThemeData.light() : ThemeData.dark();
  }
}
