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
          icon: state.isPlaying
              ? const Icon(Icons.pause)
              : const Icon(Icons.play_arrow),
          onPressed: () {
            state.isPlaying ? cubit.pause() : cubit.play();
          },
        ),
        IconButton(
          icon: const Icon(Icons.stop),
          onPressed: cubit.stop,
        ),
        IconButton(
          icon: const Icon(Icons.replay),
          onPressed: cubit.restart,
        ),
        IconButton(
          icon: const Icon(Icons.forward_10),
          onPressed: cubit.seekForward,
        ),
        IconButton(
          icon: const Icon(Icons.replay_10),
          onPressed: cubit.seekBackward,
        ),
      ],
    );
  }
}
