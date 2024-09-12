import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_quran/app/quran/view/widget/tabs/hizb_list.dart';

import '../../view/quran_screen.dart';
import '../../view/widget/tabs/juz_list.dart';
import '../../view/widget/tabs/page_list.dart';
import '../../view/widget/tabs/surah_list.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranState());
  List<Widget> quranTabbar = [
    const Tab(text: 'Surah'),
    const Tab(text: 'juz'),
    const Tab(text: 'Page'),
    const Tab(text: 'Hizb'),
  ];
  TabController tabController(context) => TabController(
        initialIndex: state.currenIndex,
        length: 4,
        vsync: Scaffold.of(context),
      );
  toggleTabs(int val) {
    emit(state.copyWith(currenIndex: val));
  }

  List<Widget> tabBarPages = [
    const SurahList(),
    JuzList(),
    PageList(),
    HizbList()
  ];
}
