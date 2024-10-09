// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'quran_search_cubit.dart';

class QuranSearchState extends Equatable {
  const QuranSearchState(
      {this.quranSearchResult, this.requestState = RequestState.error});
  final List<QuranViewModel>? quranSearchResult;
  final RequestState requestState;

  QuranSearchState copyWith({
    List<QuranViewModel>? quranSearchResult,
    RequestState? requestState,
  }) {
    return QuranSearchState(
      quranSearchResult: quranSearchResult ?? this.quranSearchResult,
      requestState: requestState ?? this.requestState,
    );
  }

  @override
  List<Object?> get props => [quranSearchResult, requestState];
}
