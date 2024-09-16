part of 'quran_cubit.dart';

class QuranState extends Equatable {
  final int currenIndex;
  final SurahModel? surahModel;
  final RequestState surahState;
  final JuzeNumberModel? juzeNumberModel;
  final RequestState juzeState;
  final HizbNumberModel? hizbNumberModel;
  final RequestState hizbState;
  final bool? isJuze;
  final int? lastSurah;
  final int? lastAyah;
  final double lastPositionSaved;
  final int? juzeId;
  QuranState(
      {this.currenIndex = 0,
      this.surahModel,
      this.surahState = RequestState.loading,
      this.juzeNumberModel,
      this.juzeState = RequestState.loading,
      this.hizbNumberModel,
      this.hizbState = RequestState.loading,
      this.isJuze,
      this.lastSurah,
      this.lastAyah,
      this.lastPositionSaved = 0.0,
      this.juzeId});

  QuranState copyWith(
      {int? currenIndex,
      SurahModel? surahModel,
      RequestState? surahState,
      JuzeNumberModel? juzeNumberModel,
      RequestState? juzeState,
      HizbNumberModel? hizbNumberModel,
      RequestState? hizbState,
      bool? isJuze,
      int? lastSurah,
      int? lastAyah,
      double? lastPositionSaved,
      int? juzeId}) {
    return QuranState(
        currenIndex: currenIndex ?? this.currenIndex,
        surahState: surahState ?? this.surahState,
        surahModel: surahModel ?? this.surahModel,
        juzeNumberModel: juzeNumberModel ?? this.juzeNumberModel,
        juzeState: juzeState ?? this.juzeState,
        hizbNumberModel: hizbNumberModel ?? this.hizbNumberModel,
        hizbState: hizbState ?? this.hizbState,
        isJuze: isJuze ?? this.isJuze,
        lastSurah: lastSurah ?? this.lastSurah,
        lastAyah: lastAyah ?? this.lastAyah,
        lastPositionSaved: lastPositionSaved ?? this.lastPositionSaved,
        juzeId: juzeId ?? this.juzeId);
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
      isJuze,
      lastSurah,
      lastAyah,
      lastPositionSaved,
      juzeId
    ];
  }
}
