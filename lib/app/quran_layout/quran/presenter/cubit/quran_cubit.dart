import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:the_quran/app/quran_layout/quran/data/model/hizb_number_model/hizb_number_model/hizb_number_model.dart';
import 'package:the_quran/app/quran_layout/quran/data/model/juze_number_model/juze_number_model/juze_number_model.dart';
import 'package:the_quran/app/quran_layout/quran/data/model/surah_model/surah_model.dart';
import 'package:the_quran/app/quran_layout/quran/data/repo/reading_repo.dart';
import 'package:the_quran/core/localizations/localizations_service.dart';

import '../../../../../core/enum_state/request_state.dart';
import '../../../../../core/hive_database/helper/hive_helper.dart';
import '../../../../../core/hive_database/hive_reading_model.dart';
import '../../data/model/reads_model/reads_model.dart';
import '../../data/repo/hizb_repo.dart';
import '../../data/repo/juze_repo.dart';
import '../../data/repo/surah_repo.dart';
import '../../view/widget/tabs/juz_list.dart';
import '../../view/widget/tabs/reads/reads.dart';
import '../../view/widget/tabs/surah_list.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit(this._surahRepo, this._juzeRepo, this._hizbRepo, this._readingRepo)
      : super(QuranState(
            hiveReadingModel: HiveReadingModel(
                isJuze: false,
                lastAyah: 1,
                lastJuze: 1,
                lastPositionSaved: 0.0,
                lastSurah: 1))) {
    loadLastReadingPositions();
    getSura();
    getJuze();
    getHizb();
    getRead();
  }

  ScrollController scrollController = ScrollController();
  final SurahRepo _surahRepo;
  final JuzeRepo _juzeRepo;
  final HizbRepo _hizbRepo;
  final ReadingRepo _readingRepo;
  static HijriCalendar today = HijriCalendar.now();
  String hijriDate = today.toFormat("MMMM dd yyyy").toString();
  List<Widget> quranTabbar(context) => [
        Tab(text: 'Surah'.tr(context)),
        Tab(text: 'juz'.tr(context)),
        Tab(text: "Reads".tr(context))
        // const Tab(text: 'Hizb'),
      ];

  TabController tabController(context) => TabController(
        initialIndex: state.currenIndex,
        length: 3,
        vsync: Scaffold.of(context),
      );
  toggleTabs(int val) {
    emit(state.copyWith(currenIndex: val));
  }

  List<Widget> tabBarPages = [
    const SurahList(),
    const JuzList(),
    const ReadsList()
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

  getRead() async {
    try {
      final response = await _readingRepo.loadReading();
      emit(state.copyWith(
          readsModel: response, readsState: RequestState.success));
    } catch (e) {
      emit(state.copyWith(readsState: RequestState.error));
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
    } else {
      emit(state.copyWith(
          hiveReadingModel: null, hiveLastReadingState: RequestState.success));
    }
  }

  Future<void> saveLastReadingPosition(HiveReadingModel position) async {
    await HiveHelper().addReadingModel(position);

    await loadLastReadingPositions(); // إعادة تحميل المواضع بعد الإضافة
  }
}
