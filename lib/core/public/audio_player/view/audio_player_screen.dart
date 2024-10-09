import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_quran/core/enum_state/request_state.dart';
import '../../../get_it/service_locator.dart';
import '../../repo_quran/model/quran_view_model/quran_view_model.dart';
import '../presenter/cubit/audio_player_cubit.dart';

import 'widget/audio_player_controll_sound.dart';
import 'widget/audio_player_view_sound.dart';

class AudioPlayerBottomSheet extends StatelessWidget {
  final QuranViewModel value;
  const AudioPlayerBottomSheet({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
      bloc: getIt<AudioPlayerCubit>()
        ..getAudioUrl(value.ayaNo!.toString(), value.suraNo!.toString()),
      builder: (context, state) {
        switch (state.audioUrlState) {
          case RequestState.loading:
            return const SizedBox(
                height: 250, child: Center(child: CircularProgressIndicator()));
          case RequestState.success:
            return Container(
              padding: const EdgeInsets.all(16.0),
              height: 250,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AudioPlayerViewSound(
                      surahName: value.suraNameAr!, state: state),
                  AudioPlayerControllSound(state: state),
                ],
              ),
            ); // TODO: Handle this case.
          case RequestState.error:
            return Text(state.audioUrlErrorMessage);
        }
      },
    );
  }
}
