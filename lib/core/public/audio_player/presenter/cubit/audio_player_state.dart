part of 'audio_player_cubit.dart';

class AudioPlayerState extends Equatable {
  final Duration position;
  final Duration duration;
  final bool isPlaying;
  final AudioUrlModel? audioUrlModel;
  final RequestState audioUrlState;
  final String audioUrlErrorMessage;
  const AudioPlayerState(
      {this.position = Duration.zero,
      this.duration = Duration.zero,
      this.isPlaying = false,
      this.audioUrlModel,
      this.audioUrlState = RequestState.loading,
      this.audioUrlErrorMessage = ''});

  AudioPlayerState copyWith(
      {Duration? position,
      Duration? duration,
      bool? isPlaying,
      AudioUrlModel? audioUrlModel,
      String? audioUrlErrorMessage,
      RequestState? audioUrlState}) {
    return AudioPlayerState(
      position: position ?? this.position,
      duration: duration ?? this.duration,
      isPlaying: isPlaying ?? this.isPlaying,
      audioUrlModel: audioUrlModel ?? this.audioUrlModel,
      audioUrlErrorMessage: audioUrlErrorMessage ?? this.audioUrlErrorMessage,
      audioUrlState: audioUrlState ?? this.audioUrlState,
    );
  }

  @override
  List<Object?> get props => [
        position,
        duration,
        isPlaying,
        audioUrlErrorMessage,
        audioUrlState,
        audioUrlModel
      ];
}
