import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:the_quran/core/public/audio_player/data/repo/audio_player_repo.dart';
import 'package:the_quran/core/enum_state/request_state.dart';

import '../../../../networking/errorr_handler/api_error_model.dart';
import '../../data/model/audio_url_model/audio_url_model.dart';
part 'audio_player_state.dart';

class AudioPlayerCubit extends Cubit<AudioPlayerState> {
  final AudioPlayer _audioPlayer;
  final AudioPlayerRepo _audioPlayerRepo;
  AudioPlayerCubit(this._audioPlayerRepo)
      : _audioPlayer = AudioPlayer(),
        super(const AudioPlayerState()) {
    _audioPlayer.onPositionChanged.listen((position) {
      emit(state.copyWith(position: position));
    });

    _audioPlayer.onDurationChanged.listen((duration) {
      emit(state.copyWith(duration: duration));
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      emit(state.copyWith(isPlaying: false, position: Duration.zero));
    });
  }

  void play(String url) async {
    await _audioPlayer.play(UrlSource(url));
    emit(state.copyWith(isPlaying: true));
  }

  void pause() async {
    await _audioPlayer.pause();
    emit(state.copyWith(isPlaying: false));
  }

  void resume() async {
    await _audioPlayer.resume();
    emit(state.copyWith(isPlaying: true));
  }

  void stop() async {
    await _audioPlayer.stop();
    emit(state.copyWith(isPlaying: false, position: Duration.zero));
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
    emit(state.copyWith(position: position));
  }

  Future getAudioUrl(String ayahId, String surahId) async {
    emit(state.copyWith(audioUrlState: RequestState.loading));

    final result = await _audioPlayerRepo.getAudioUrl(ayahId, surahId);
    result.when(
      success: (data) {
        emit(state.copyWith(
            audioUrlModel: data, audioUrlState: RequestState.success));
      },
      failure: (ApiErrorModel apiErrorModel) {
        emit(state.copyWith(
            audioUrlErrorMessage: apiErrorModel.message,
            audioUrlState: RequestState.error));
      },
    );
  }
}
