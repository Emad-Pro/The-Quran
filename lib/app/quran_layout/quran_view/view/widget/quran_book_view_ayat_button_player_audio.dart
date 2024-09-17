import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/get_it/service_locator.dart';
import '../../../../../core/public/audio_player/presenter/cubit/audio_player_cubit.dart';
import '../../../../../core/public/audio_player/view/audio_player_screen.dart';
import '../../../../../core/public/repo_quran/model/quran_view_model/quran_view_model.dart';

class QuranBookViewAyatButtonPlayerAudio extends StatelessWidget {
  const QuranBookViewAyatButtonPlayerAudio({super.key, required this.value});
  final QuranViewModel value;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (_) => AudioPlayerBottomSheet(value: value),
        ).then((onValue) {
          getIt<AudioPlayerCubit>().stop();
        });
      },
      icon: SvgPicture.asset(
        "assets/images/svg/play.svg",
        colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.onSurface, BlendMode.srcIn),
      ),
    );
  }
}
