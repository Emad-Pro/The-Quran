import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

import '../../../get_it/service_locator.dart';

class AudioPlayerHandler extends BaseAudioHandler with SeekHandler {
  final AudioPlayer audioPlayer = getIt<AudioPlayer>();

  AudioPlayerHandler() {
    audioPlayer.playbackEventStream.listen((event) {
      playbackState.add(_transformEvent(event));
    });

    audioPlayer.processingStateStream.listen((state) {
      if (state == ProcessingState.completed) {
        _handleCompletion();
      }
    });
  }

  PlaybackState _transformEvent(PlaybackEvent event) {
    return PlaybackState(
      controls: [
        MediaControl.play,
        MediaControl.pause,
        MediaControl.stop,
      ],
      systemActions: const {
        MediaAction.seek,
        MediaAction.playPause,
        MediaAction.setSpeed,
      },
      androidCompactActionIndices: const [0, 1, 2],
      playing: audioPlayer.playing,
      updatePosition: audioPlayer.position,
      bufferedPosition: audioPlayer.bufferedPosition,
      speed: audioPlayer.speed,
      queueIndex: audioPlayer.currentIndex,
      repeatMode: audioPlayer.loopMode == LoopMode.off
          ? AudioServiceRepeatMode.none
          : AudioServiceRepeatMode.one,
      shuffleMode: audioPlayer.shuffleModeEnabled
          ? AudioServiceShuffleMode.all
          : AudioServiceShuffleMode.none,
    );
  }

  // التعامل مع اكتمال الصوت
  void _handleCompletion() {
    if (audioPlayer.loopMode == LoopMode.one) {
      seek(Duration.zero);
      play();
    } else {
      stop();
    }
  }

  @override
  Future<void> play() => audioPlayer.play();

  @override
  Future<void> pause() => audioPlayer.pause();

  @override
  Future<void> stop() => audioPlayer.stop();

  @override
  Future<void> seek(Duration position) => audioPlayer.seek(position);

  // تعيين مصدر الصوت
  Future<void> setAudioSource(String url) async {
    await audioPlayer.setUrl(url);
  }
}
