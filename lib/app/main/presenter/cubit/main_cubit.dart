import 'package:bloc/bloc.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter/material.dart';

import 'package:the_quran/app/quran/view/quran_screen.dart';
import 'package:the_quran/core/widget/custom_svg_image.dart';

import '../../../bookmarks/view/bookmarks_screen.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState());
  final pages = [
    const QuranScreen(),
    const Text("1"),
    const Text("1"),
    const Text("1"),
    const BookmarksScreen()
  ];
  final List<String> appbarTitle = [
    "Quran Kareem",
    "Azkar",
    "Salatk",
    "Do3aa",
    "Bookmarks"
  ];
  final bottomNavibarItem = [
    BottomBarItem(
      iconBuilder: (color) => CustomSvgImage(
        path: "assets/images/svg/quran.svg",
        color: color,
      ),
    ),
    BottomBarItem(
      iconBuilder: (color) => CustomSvgImage(
        path: "assets/images/svg/azkar.svg",
        color: color,
      ),
    ),
    BottomBarItem(
      iconBuilder: (color) => CustomSvgImage(
        path: "assets/images/svg/salah.svg",
        color: color,
      ),
    ),
    BottomBarItem(
      iconBuilder: (color) => CustomSvgImage(
        path: "assets/images/svg/do3aa.svg",
        color: color,
      ),
    ),
    BottomBarItem(
      iconBuilder: (color) => CustomSvgImage(
        path: "assets/images/svg/mark.svg",
        color: color,
      ),
    ),
  ];
  toggleNavBar(int newIndex) {
    emit(state.copyWith(selectedIndex: newIndex));
  }
}
