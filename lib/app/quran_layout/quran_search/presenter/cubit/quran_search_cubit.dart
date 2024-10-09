import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:the_quran/core/enum_state/request_state.dart';
import 'package:the_quran/core/public/repo_quran/model/quran_view_model/quran_view_model.dart';
import 'package:the_quran/core/public/repo_quran/quran_view_repo/quran_view_repo.dart';

part 'quran_search_state.dart';

class QuranSearchCubit extends Cubit<QuranSearchState> {
  QuranSearchCubit() : super(const QuranSearchState());
  TextEditingController searchController = TextEditingController();
  List<QuranViewModel> quranQueryList = [];
  void searchList(String query) {
    quranQueryList = [];
    emit(state.copyWith(requestState: RequestState.loading));
    quranQueryList = QuranViewRepo.allQuran
        .where((item) => item.ayaTextEmlaey!.contains(query))
        .toList();
    emit(state.copyWith(
        quranSearchResult: quranQueryList, requestState: RequestState.success));
  }
}
