// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'quran_page_cubit.dart';

class QuranPageState extends Equatable {
  final RequestState quranViewState;
  final List<QuranPageModel>? quranPageModel;

  QuranPageState(
      {this.quranViewState = RequestState.loading, this.quranPageModel});

  @override
  List<Object?> get props => [quranViewState, quranPageModel];

  QuranPageState copyWith({
    RequestState? quranViewState,
    List<QuranPageModel>? quranPageModel,
  }) {
    return QuranPageState(
      quranViewState: quranViewState ?? this.quranViewState,
      quranPageModel: quranPageModel ?? this.quranPageModel,
    );
  }
}
