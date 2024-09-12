// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'main_cubit.dart';

class MainState {
  final int selectedIndex;

  MainState({this.selectedIndex = 0});

  MainState copyWith({
    int? selectedIndex,
  }) {
    return MainState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
