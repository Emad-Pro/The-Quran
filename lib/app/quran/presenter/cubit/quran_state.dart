// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'quran_cubit.dart';

class QuranState {
  final int currenIndex;
  final SurahModel? surahModel;
  final RequestState surahState;
  final JuzeNumberModel? juzeNumberModel;
  final RequestState juzeState;
  final HizbNumberModel? hizbNumberModel;
  final RequestState hizbState;
  QuranState({
    this.currenIndex = 0,
    this.surahModel,
    this.surahState = RequestState.loading,
    this.juzeNumberModel,
    this.juzeState = RequestState.loading,
    this.hizbNumberModel,
    this.hizbState = RequestState.loading,
  });

  QuranState copyWith({
    int? currenIndex,
    SurahModel? surahModel,
    RequestState? surahState,
    JuzeNumberModel? juzeNumberModel,
    RequestState? juzeState,
    HizbNumberModel? hizbNumberModel,
    RequestState? hizbState,
  }) {
    return QuranState(
      currenIndex: currenIndex ?? this.currenIndex,
      surahState: surahState ?? this.surahState,
      surahModel: surahModel ?? this.surahModel,
      juzeNumberModel: juzeNumberModel ?? this.juzeNumberModel,
      juzeState: juzeState ?? this.juzeState,
      hizbNumberModel: hizbNumberModel ?? this.hizbNumberModel,
      hizbState: hizbState ?? this.hizbState,
    );
  }
}
