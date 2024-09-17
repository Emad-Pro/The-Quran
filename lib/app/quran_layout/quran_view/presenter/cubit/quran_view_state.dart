// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'quran_view_cubit.dart';

class QuranViewState extends Equatable {
  final RequestState quranViewState;
  final List<QuranViewModel>? quranPageModel;

  const QuranViewState({
    this.quranViewState = RequestState.loading,
    this.quranPageModel,

  });

  @override
  List<Object?> get props => [
        quranViewState,
        quranPageModel,
      ];

  QuranViewState copyWith(
      {RequestState? quranViewState,
      List<QuranViewModel>? quranPageModel,
     }) {
    return QuranViewState(
        quranViewState: quranViewState ?? this.quranViewState,
        quranPageModel: quranPageModel ?? this.quranPageModel,
);
  }
}
