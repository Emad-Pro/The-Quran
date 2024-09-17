import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:the_quran/app/main/view/widget/custom_appbar.dart';
import 'package:the_quran/app/quran_layout/quran/data/model/hizb_number_model/hizb_number_model/hizb_number_model.dart';
import 'package:the_quran/app/quran_layout/quran/data/model/juze_number_model/juze_number_model/juze_number_model.dart';
import 'package:the_quran/app/quran_layout/quran/data/model/surah_model/surah_model.dart';
import 'package:the_quran/core/localizations/localizations_service.dart';

import '../../../../../core/enum_state/request_state.dart';
import '../../../../../core/hive_database/helper/hive_helper.dart';
import '../../../../../core/hive_database/hive_reading_model.dart';
import '../../data/repo/hizb_repo.dart';
import '../../data/repo/juze_repo.dart';
import '../../data/repo/surah_repo.dart';
import '../../view/widget/tabs/juz_list.dart';
import '../../view/widget/tabs/surah_list.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit(this._surahRepo, this._juzeRepo, this._hizbRepo)
      : super(QuranState(
            hiveReadingModel: HiveReadingModel(
          isJuze: false,
          lastAyah: 1,
          lastJuze: 1,
          lastPositionSaved: 0.0,
          lastSurah: 1,
        ))) {
    loadLastReadingPositions();
    getSura();
    getJuze();
    getHizb();
  }

  final SurahRepo _surahRepo;
  final JuzeRepo _juzeRepo;
  final HizbRepo _hizbRepo;
  List<Widget> quranTabbar(context) => [
        Tab(text: 'Surah'.tr(context)),
        Tab(text: 'juz'.tr(context)),
        //  const Tab(text: 'Page'),
        // const Tab(text: 'Hizb'),
      ];
  TabController tabController(context) => TabController(
        initialIndex: state.currenIndex,
        length: 2,
        vsync: Scaffold.of(context),
      );
  toggleTabs(int val) {
    emit(state.copyWith(currenIndex: val));
  }

  List<Widget> tabBarPages = [
    const SurahList(),
    const JuzList(),
    //  const PageList(),
    // const HizbList()
  ];

  getSura() async {
    try {
      final response = await _surahRepo.loadSuwer();
      emit(state.copyWith(
          surahModel: response, surahState: RequestState.success));
    } catch (e) {
      emit(state.copyWith(surahState: RequestState.error));
    }
  }

  getJuze() async {
    try {
      final response = await _juzeRepo.loadJuze();
      emit(state.copyWith(
          juzeNumberModel: response, juzeState: RequestState.success));
    } catch (e) {
      emit(state.copyWith(juzeState: RequestState.error));
    }
  }

  getHizb() async {
    try {
      final response = await _hizbRepo.loadHizb();
      emit(state.copyWith(
          hizbNumberModel: response, hizbState: RequestState.success));
    } catch (e) {
      emit(state.copyWith(hizbState: RequestState.error));
    }
  }

  Future<void> loadLastReadingPositions() async {
    final storageHelper = HiveHelper();
    final lastReadingPositions = storageHelper.loadReadingModels();
    if (lastReadingPositions.isNotEmpty) {
      final lastReadingPosition = lastReadingPositions.last;
      emit(state.copyWith(
          hiveReadingModel: lastReadingPosition,
          hiveLastReadingState: RequestState.success));
    }
  }

  Future<void> saveLastReadingPosition(HiveReadingModel position) async {
    await HiveHelper().addReadingModel(position);

    await loadLastReadingPositions(); // إعادة تحميل المواضع بعد الإضافة
  }
}
