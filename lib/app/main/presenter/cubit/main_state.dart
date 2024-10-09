// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'main_cubit.dart';

class MainState {
  final int selectedIndex;
  final String imageDrawer;
  MainState({this.selectedIndex = 0, this.imageDrawer = ''});

  MainState copyWith({int? selectedIndex, String? imageDrawer}) {
    return MainState(
        selectedIndex: selectedIndex ?? this.selectedIndex,
        imageDrawer: imageDrawer ?? this.imageDrawer);
  }
}
