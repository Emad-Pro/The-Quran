// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'play_reads_quran_cubit.dart';

class PlayReadsQuranState extends Equatable {
  final RequestState surahPlayState;
  final List<SurahPlayModel>? surahPlayModel;
  final String errorMessage;
  final String urlSurah;

  const PlayReadsQuranState({
    this.surahPlayState = RequestState.loading,
    this.surahPlayModel = const [],
    this.errorMessage = '',
    this.urlSurah = '',
  });
  @override
  List<Object?> get props =>
      [surahPlayModel, surahPlayModel, errorMessage, urlSurah];

  PlayReadsQuranState copyWith(
      {RequestState? surahPlayState,
      List<SurahPlayModel>? surahPlayModel,
      String? errorMessage,
      String? urlSurah}) {
    return PlayReadsQuranState(
        surahPlayState: surahPlayState ?? this.surahPlayState,
        surahPlayModel: surahPlayModel ?? this.surahPlayModel,
        errorMessage: errorMessage ?? this.errorMessage,
        urlSurah: urlSurah ?? this.urlSurah);
  }
}
