// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'quran_cubit.dart';

class QuranState {
  final int currenIndex;

  QuranState({this.currenIndex = 0});

  QuranState copyWith({
    int? currenIndex,
  }) {
    return QuranState(
      currenIndex: currenIndex ?? this.currenIndex,
    );
  }
}
