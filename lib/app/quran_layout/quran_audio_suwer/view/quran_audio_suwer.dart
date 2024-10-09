import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:the_quran/core/responsive/responsive_text.dart';

import '../../../../core/enum_state/request_state.dart';
import '../../../../core/get_it/service_locator.dart';
import '../../../../core/public/audio_player/presenter/cubit/audio_player_cubit.dart';
import '../../../../core/public/audio_player/view/widget/audio_player_controll_sound.dart';
import '../../../../core/public/audio_player/view/widget/audio_player_view_sound.dart';

class QuranAudioSuwer extends StatelessWidget {
  const QuranAudioSuwer(
      {super.key,
      required this.url,
      required this.readsName,
      required this.readsType,
      required this.surahName});
  final String url;
  final String readsName;
  final String readsType;
  final String surahName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الاستماع الي القران الكريم"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/png/6628328.png",
            width: 200,
            height: MediaQuery.of(context).size.height / 4,
          ),
          const SizedBox(height: 15),
          Text("االشيخ $readsType"),
          const SizedBox(height: 10),
          Text(
            "( تلاوة $readsName )",
            style: TextStyle(
                fontSize: getResponsiveFontSize(context, fontSize: 12),
                color:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.4)),
          ),
          const SizedBox(height: 16),
          BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
            bloc: getIt<AudioPlayerCubit>()..initPlay(url),
            builder: (context, state) {
              return Container(
                padding: const EdgeInsets.all(16.0),
                height: 250,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AudioPlayerViewSound(surahName: surahName, state: state),
                    AudioPlayerControllSound(state: state),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
