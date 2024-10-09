import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:the_quran/core/public/repo_quran/quran_view_repo/quran_view_repo.dart';
import 'package:the_quran/core/enum_state/request_state.dart';
import '../../../../../core/public/repo_quran/model/quran_view_model/quran_view_model.dart';

part 'quran_view_state.dart';

class QuranViewCubit extends Cubit<QuranViewState> {
  QuranViewCubit(this._quranViewRepo) : super(const QuranViewState()) {
    lisenScroll();
  }
  final QuranViewRepo _quranViewRepo;
  ScrollController scrollController = ScrollController();

  getQuranOption(int id, bool isJuze) {
    if (isJuze) {
      getJuzeView(id);
    } else {
      getSurahView(id);
    }
  }

  lisenScroll() {
    scrollController.addListener(() {
      saveScrollPosition = scrollController.position.pixels;
    });
  }

  void scrollToLastPosition(double position) async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // تأكد أن عنصر التمرير مرتبط بـ ScrollController
      if (scrollController.hasClients) {
        await scrollController.animateTo(
          position.toDouble(),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  double saveScrollPosition = 0.0;

  get svaeScroll => saveScrollPosition;

  getJuzeView(int? id) async {
    emit(state.copyWith(quranViewState: RequestState.loading));
    try {
      final result = await _quranViewRepo.load(juzzNumber: id);
      emit(state.copyWith(
          quranViewState: RequestState.success, quranPageModel: result));
    } catch (e) {
      emit(state.copyWith(quranViewState: RequestState.error));
    }
  }

  getSurahView(int? id) async {
    emit(state.copyWith(quranViewState: RequestState.loading));
    try {
      final result = await _quranViewRepo.loadSurah(surahId: id);
      emit(state.copyWith(
          quranViewState: RequestState.success, quranPageModel: result));
    } catch (e) {
      emit(state.copyWith(quranViewState: RequestState.error));
    }
  }
}
