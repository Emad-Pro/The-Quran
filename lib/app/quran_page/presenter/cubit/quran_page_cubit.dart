import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:the_quran/app/quran_page/data/model/quran_page_model/quran_page_model.dart';
import 'package:the_quran/app/quran_page/data/quran_page_repo/quran_page_repo.dart';
import 'package:the_quran/core/enum_state/request_state.dart';

part 'quran_page_state.dart';

class QuranPageCubit extends Cubit<QuranPageState> {
  QuranPageCubit(this._quranPageRepo) : super(QuranPageState());
  final QuranPageRepo _quranPageRepo;

  getJuzeView(int id) async {
    try {
      final result = await _quranPageRepo.load(juzzNumber: id);
      emit(state.copyWith(
          quranViewState: RequestState.success, quranPageModel: result));
    } catch (e) {
      emit(state.copyWith(quranViewState: RequestState.error));
    }
  }
}
