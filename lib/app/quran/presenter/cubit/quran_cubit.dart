import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:the_quran/app/quran/data/model/hizb_number_model/hizb_number_model/hizb_number_model.dart';
import 'package:the_quran/app/quran/data/model/juze_number_model/juze_number_model/juze_number_model.dart';
import 'package:the_quran/app/quran/data/model/surah_model/surah_model.dart';
import '../../../../core/bloc_cache/cache_service.dart';
import '../../../../core/enum_state/request_state.dart';
import '../../data/repo/hizb_repo.dart';
import '../../data/repo/juze_repo.dart';
import '../../data/repo/surah_repo.dart';
import '../../view/widget/tabs/juz_list.dart';
import '../../view/widget/tabs/surah_list.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit(this._surahRepo, this._juzeRepo, this._hizbRepo)
      : super(QuranState()) {
    loadLastReadingPosition();
    getSura();
    getJuze();
    getHizb();
  }

  final SurahRepo _surahRepo;
  final JuzeRepo _juzeRepo;
  final HizbRepo _hizbRepo;
  List<Widget> quranTabbar = [
    const Tab(text: 'Surah'),
    const Tab(text: 'juz'),
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

  Future<void> loadLastReadingPosition() async {
    final storageHelper = StorageHelper();
    final lastSurah = await storageHelper.getData('last_surah') ?? 1;
    final lastAyah = await storageHelper.getData('last_ayah') ?? 1;
    final isJuze = await storageHelper.getData('isJuze') ?? false;
    final lastJuze = await storageHelper.getData('lastJuze') ?? 1;
    final lastPositionSaved = storageHelper.getData("scrollPosition") ?? 0;
    emit(state.copyWith(
        juzeId: lastJuze,
        isJuze: isJuze,
        lastAyah: lastAyah,
        lastSurah: lastSurah,
        lastPositionSaved: lastPositionSaved));
  }

  // حفظ الموضع الحالي
  Future<void> saveLastReadingPosition(
      int surah, int ayah, bool isJuze, int juzeId) async {
    final storage = StorageHelper();
    await storage.saveData('last_surah', surah);
    await storage.saveData('last_ayah', ayah);
    await storage.saveData('isJuze', isJuze);
    await storage.saveData('lastJuze', juzeId);
    await loadLastReadingPosition();
  }
}
