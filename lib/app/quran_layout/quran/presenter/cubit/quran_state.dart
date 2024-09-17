part of 'quran_cubit.dart';

class QuranState extends Equatable {
  final int currenIndex;
  final SurahModel? surahModel;
  final RequestState surahState;
  final JuzeNumberModel? juzeNumberModel;
  final RequestState juzeState;
  final HizbNumberModel? hizbNumberModel;
  final RequestState hizbState;
  final HiveReadingModel? hiveReadingModel;
  final RequestState hiveLastReadingState;
  const QuranState(
      {this.currenIndex = 0,
      this.surahModel,
      this.surahState = RequestState.loading,
      this.juzeNumberModel,
      this.juzeState = RequestState.loading,
      this.hizbNumberModel,
      this.hizbState = RequestState.loading,
      this.hiveReadingModel,
      this.hiveLastReadingState = RequestState.loading});

  QuranState copyWith(
      {int? currenIndex,
      SurahModel? surahModel,
      RequestState? surahState,
      JuzeNumberModel? juzeNumberModel,
      RequestState? juzeState,
      HizbNumberModel? hizbNumberModel,
      RequestState? hizbState,
      HiveReadingModel? hiveReadingModel,
      RequestState? hiveLastReadingState}) {
    return QuranState(
        currenIndex: currenIndex ?? this.currenIndex,
        surahState: surahState ?? this.surahState,
        surahModel: surahModel ?? this.surahModel,
        juzeNumberModel: juzeNumberModel ?? this.juzeNumberModel,
        juzeState: juzeState ?? this.juzeState,
        hizbNumberModel: hizbNumberModel ?? this.hizbNumberModel,
        hizbState: hizbState ?? this.hizbState,
        hiveReadingModel: hiveReadingModel ?? this.hiveReadingModel,
        hiveLastReadingState:
            hiveLastReadingState ?? this.hiveLastReadingState);
  }

  @override
  List<Object?> get props {
    return [
      currenIndex,
      surahModel,
      surahState,
      juzeNumberModel,
      juzeState,
      hizbNumberModel,
      hizbState,
      hiveReadingModel,
      hiveLastReadingState
    ];
  }
}
