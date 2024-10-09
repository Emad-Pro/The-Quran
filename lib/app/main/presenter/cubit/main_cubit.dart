import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter/material.dart';

import 'package:the_quran/app/quran_layout/quran/view/quran_screen.dart';
import 'package:the_quran/core/widget/custom_svg_image.dart';

import '../../../bookmarks/view/bookmarks_screen.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState(imageDrawer: "assets/images/svg/day.svg")) {
    _updateImageBasedOnTime();
    timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      _updateImageBasedOnTime();
    });
  }
  Timer? timer;
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

  void _updateImageBasedOnTime() {
    final int currentHour = DateTime.now().hour;
    print(currentHour);
    final String selectedImage = (currentHour >= 6 && currentHour < 18)
        ? 'assets/images/svg/day.svg' // صورة الصباح
        : 'assets/images/svg/night.svg'; // صورة المساء
    emit(state.copyWith(imageDrawer: selectedImage));
  }
}
