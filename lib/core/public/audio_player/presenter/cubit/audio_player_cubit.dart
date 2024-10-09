import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';

import 'package:the_quran/core/public/audio_player/data/repo/audio_player_repo.dart';

import '../../audio_service/audio_service.dart';
import '../../../../enum_state/request_state.dart';
import '../../../../networking/errorr_handler/api_error_model.dart';
import '../../data/model/audio_url_model/audio_url_model.dart';
part 'audio_player_state.dart';

// Cubit للتحكم في مشغل الصوت
class AudioPlayerCubit extends Cubit<AudioPlayerState> {
  final AudioPlayerRepo _audioPlayerRepo;
  final AudioPlayerHandler _audioHandler;

  AudioPlayerCubit(this._audioPlayerRepo, this._audioHandler)
      : super(const AudioPlayerState()) {
    _initProgressStateChanges();
  }

  void _initProgressStateChanges() {
    _audioHandler.audioPlayer.processingStateStream.listen((processingState) {
      if (processingState != ProcessingState.completed) {
        emit(state.copyWith(isPlaying: false));
      }
      emit(state.copyWith(processingState: processingState));
    });

    _audioHandler.audioPlayer.durationStream.listen((duration) {
      emit(state.copyWith(duration: duration ?? Duration.zero));
    });

    _audioHandler.audioPlayer.positionStream.listen((positionDuration) {
      emit(state.copyWith(position: positionDuration));
    });

    _audioHandler.audioPlayer.playingStream.listen((isPlaying) {
      emit(state.copyWith(isPlaying: isPlaying));
    });
  }

  Future<void> initPlay(String url) async {
    try {
      await _audioHandler.setAudioSource(url);
      await play();
    } catch (e) {
      print('Error initializing audio: $e');
    }
  }

  Future<void> play() async {
    try {
      if (!_audioHandler.audioPlayer.playing) {
        await _audioHandler.play();
        emit(state.copyWith(isPlaying: true));
      }
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  Future<void> pause() async {
    try {
      if (_audioHandler.audioPlayer.playing) {
        await _audioHandler.pause();
        emit(state.copyWith(isPlaying: false));
      }
    } catch (e) {
      print('Error pausing audio: $e');
    }
  }

  void seek(Duration position) {
    try {
      final newPosition =
          position >= Duration.zero && position <= state.duration
              ? position
              : Duration.zero; // تأكد أن الموضع ضمن المدة الكلية
      _audioHandler.seek(newPosition);
      emit(state.copyWith(position: newPosition));
    } catch (e) {
      print('Error seeking audio: $e');
    }
  }

  Future<void> stop() async {
    try {
      if (_audioHandler.audioPlayer.playing) {
        await _audioHandler.stop();
        emit(state.copyWith(
            processingState: ProcessingState.idle,
            position: Duration.zero,
            isPlaying: false));
      }
    } catch (e) {
      print('Error stopping audio: $e');
    }
  }

  Future<void> restart() async {
    try {
      await _audioHandler.seek(Duration.zero);
      if (!_audioHandler.audioPlayer.playing) {
        await play();
      } else {
        emit(state.copyWith(position: Duration.zero));
      }
    } catch (e) {
      print('Error restarting audio: $e');
    }
  }

  void seekForward() {
    final newPosition = state.position + const Duration(seconds: 10);
    seek(newPosition);
  }

  void seekBackward() {
    final newPosition = state.position - const Duration(seconds: 10);
    seek(newPosition);
  }

  Future<void> getAudioUrl(String ayahId, String surahId) async {
    emit(state.copyWith(audioUrlState: RequestState.loading));

    final result = await _audioPlayerRepo.getAudioUrl(ayahId, surahId);
    result.when(
      success: (data) {
        //  final AudioUrlModel audioUrlModel = data.data;
        emit(state.copyWith(audioUrlState: RequestState.success));
        // play(audioUrlModel.data!.audio!);
      },
      failure: (ApiErrorModel apiErrorModel) {
        emit(state.copyWith(
            audioUrlErrorMessage: apiErrorModel.message,
            audioUrlState: RequestState.error));
      },
    );
  }
}
