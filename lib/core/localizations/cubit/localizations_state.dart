part of 'localizations_cubit.dart';

@freezed
class LocalizationsState with _$LocalizationsState {
  const factory LocalizationsState({required Locale locale}) =
      _LocalizationsState;

  factory LocalizationsState.initial() =>
      LocalizationsState(locale: LocalizationsService.locale);
}
