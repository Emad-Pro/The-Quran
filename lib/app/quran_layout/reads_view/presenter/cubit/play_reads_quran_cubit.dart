import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:the_quran/app/quran_layout/reads_view/data/model/surah_play_model.dart';
import 'package:the_quran/core/enum_state/request_state.dart';
import '../../../quran/data/model/reads_model/moshaf.dart';
import '../../../quran/data/model/surah_model/datum.dart';

part 'play_reads_quran_state.dart';

class PlayReadsQuranCubit extends Cubit<PlayReadsQuranState> {
  PlayReadsQuranCubit() : super(const PlayReadsQuranState());
  fetchSurahName(Moshaf moshaf, List<Datum> surahName) async {
    emit(state.copyWith(surahPlayState: RequestState.loading));
    List<SurahPlayModel> surahPlayModel = [];
    for (var action in moshaf.surahList!) {
      for (var suranNameAr in surahName) {
        if (action == suranNameAr.number) {
          surahPlayModel.add(SurahPlayModel.fromJson({
            "name": "${suranNameAr.name}",
            "server": moshaf.server,
            "id": suranNameAr.number,
            "surah_list": moshaf.surahList,
            "surah_total": moshaf.surahTotal,
            "moshaf_type": moshaf.moshafType,
          }));
        }
      }
    }
    emit(state.copyWith(
        surahPlayModel: surahPlayModel, surahPlayState: RequestState.success));
  }

  String fetchUrlSurah(String server, int id) {
    String result = '';
    if (id <= 9) {
      result = "${server}00$id.mp3";
    } else if (id >= 10 && id <= 99) {
      result = "${server}0$id.mp3";
    } else {
      result = "$server$id.mp3";
    }
    return result;
  }
}
