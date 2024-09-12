import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_quran/core/localizations/localizations_service.dart';

part 'localizations_state.dart';
part 'localizations_cubit.freezed.dart';

class LocalizationsCubit extends Cubit<LocalizationsState> {
  LocalizationsCubit() : super(LocalizationsState.initial());

  Future<void> changeLocale(Locale locale) async {
    emit(state.copyWith(locale: locale));
    await LocalizationsService.setLocaleCode(locale.languageCode);
  }
}
