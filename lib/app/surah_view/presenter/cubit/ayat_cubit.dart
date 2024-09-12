import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_quran/app/surah_view/data/repo/ayat_repo.dart';
import 'package:the_quran/core/enum_state/request_state.dart';

import '../../data/model/ayat_model/ayat_model.dart';

part 'ayat_state.dart';

class AyatCubit extends Cubit<AyatState> {
  AyatCubit(this.ayatRepo) : super(AyatState());
  final AyatRepo ayatRepo;
  getSurahWithId(int id) async {
    emit(state.copyWith(ayatSurahState: RequestState.loading));
    try {
      final result = await ayatRepo.loadSurah(id);
      emit(state.copyWith(
          ayatModel: result, ayatSurahState: RequestState.success));
    } catch (e) {
      emit(state.copyWith(ayatSurahState: RequestState.error));
    }
  }
}
