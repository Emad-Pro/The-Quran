import 'package:flutter/material.dart';

import '../../../../get_it/service_locator.dart';
import '../../presenter/cubit/audio_player_cubit.dart';

class AudioPlayerControllSound extends StatelessWidget {
  const AudioPlayerControllSound({
    super.key,
    required this.state,
  });

  final AudioPlayerState state;

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<AudioPlayerCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.replay_10),
          onPressed: () {
            final newPosition = state.position - const Duration(seconds: 10);
            cubit.seek(
                newPosition >= Duration.zero ? newPosition : Duration.zero);
          },
        ),
        IconButton(
          icon: Icon(state.isPlaying ? Icons.pause : Icons.play_arrow),
          onPressed: () {
            if (state.isPlaying) {
              cubit.pause();
            } else if (state.position == Duration.zero && !state.isPlaying) {
              cubit.play(state.audioUrlModel!.data!.audio!);
            } else {
              cubit.resume();
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.forward_10),
          onPressed: () {
            final newPosition = state.position + const Duration(seconds: 10);
            if (newPosition <= state.duration) {
              cubit.seek(newPosition);
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.stop),
          onPressed: () {
            cubit.stop();
          },
        ),
      ],
    );
  }
}
