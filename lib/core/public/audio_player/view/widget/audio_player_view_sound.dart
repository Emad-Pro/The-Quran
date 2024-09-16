import 'package:flutter/material.dart';
import 'package:the_quran/core/const/colors.dart';

import '../../../../get_it/service_locator.dart';
import '../../presenter/cubit/audio_player_cubit.dart';
import '../method/format_duration.dart';

class AudioPlayerViewSound extends StatelessWidget {
  const AudioPlayerViewSound({
    super.key,
    required this.surahName,
    required this.state,
  });

  final String surahName;
  final AudioPlayerState state;

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<AudioPlayerCubit>();
    return Column(
      children: [
        Text(surahName,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontFamily: "quran")),
        const SizedBox(height: 10),
        Slider(
          activeColor: ColorsConst.pruble,
          value: state.position.inSeconds.toDouble(),
          max: state.duration.inSeconds.toDouble(),
          onChanged: (value) {
            cubit.seek(Duration(seconds: value.toInt()));
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(formatDuration(state.position)),
            Text(formatDuration(state.duration)),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
