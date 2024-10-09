// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'audio_player_cubit.dart';

class AudioPlayerState extends Equatable {
  final ProcessingState processingState;
  final bool isPlaying; // حالة اللعب أو التوقف المؤقت

  final Duration position;
  final Duration duration;
  final String audioUrlErrorMessage;
  final RequestState audioUrlState;
  final AudioUrlModel? audioUrlModel;
  final double speed;
  final bool isLooping;
  final bool isShuffling;
  final double volume;

  const AudioPlayerState({
    this.processingState = ProcessingState.loading,
    this.isPlaying = false, // إضافة هذه الحالة
    this.position = Duration.zero,
    this.duration = Duration.zero,
    this.audioUrlState = RequestState.loading,
    this.audioUrlModel,
    this.audioUrlErrorMessage = '',
    this.speed = 1.0,
    this.isLooping = false,
    this.isShuffling = false,
    this.volume = 1.0,
  });

  AudioPlayerState copyWith({
    ProcessingState? processingState,
    bool? isPlaying, // إضافة حالة isPlaying هنا أيضًا
    Duration? position,
    Duration? duration,
    RequestState? audioUrlState,
    String? audioUrlErrorMessage,
    AudioUrlModel? audioUrlModel,
    double? speed,
    bool? isLooping,
    bool? isShuffling,
    double? volume,
  }) {
    return AudioPlayerState(
      processingState: processingState ?? this.processingState,
      isPlaying: isPlaying ?? this.isPlaying, // تحديث isPlaying
      position: position ?? this.position,
      duration: duration ?? this.duration,
      audioUrlState: audioUrlState ?? this.audioUrlState,
      audioUrlErrorMessage: audioUrlErrorMessage ?? this.audioUrlErrorMessage,
      audioUrlModel: audioUrlModel ?? this.audioUrlModel,
      speed: speed ?? this.speed,
      isLooping: isLooping ?? this.isLooping,
      isShuffling: isShuffling ?? this.isShuffling,
      volume: volume ?? this.volume,
    );
  }

  @override
  List<Object?> get props {
    return [
      processingState,
      isPlaying,
      position,
      duration,
      audioUrlErrorMessage,
      audioUrlState,
      audioUrlModel,
      speed,
      isLooping,
      isShuffling,
      volume,
    ];
  }
}
