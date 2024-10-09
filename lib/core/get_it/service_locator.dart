import 'package:audio_service/audio_service.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:the_quran/app/quran_layout/quran/data/repo/surah_repo.dart';
import 'package:the_quran/app/quran_layout/quran/presenter/cubit/quran_cubit.dart';

import 'package:the_quran/core/public/audio_player/data/repo/audio_player_repo.dart';

import '../../app/main/presenter/cubit/main_cubit.dart';
import '../../app/quran_layout/quran/data/repo/hizb_repo.dart';
import '../../app/quran_layout/quran/data/repo/juze_repo.dart';
import '../../app/quran_layout/quran/data/repo/reading_repo.dart';
import '../../app/quran_layout/quran_search/presenter/cubit/quran_search_cubit.dart';
import '../../app/quran_layout/reads_view/presenter/cubit/play_reads_quran_cubit.dart';

import '../public/audio_player/audio_service/audio_service.dart';
import '../public/repo_quran/quran_view_repo/quran_view_repo.dart';
import '../../app/quran_layout/quran_view/presenter/cubit/quran_view_cubit.dart';

import '../public/audio_player/presenter/cubit/audio_player_cubit.dart';
import '../localizations/cubit/localizations_cubit.dart';
import '../theme/cubit/theme_cubit.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void init() async {
    getIt.registerLazySingleton(() => AudioPlayer());

    final audioHandler = await AudioService.init(
      builder: () => AudioPlayerHandler(),
      config: const AudioServiceConfig(
        androidNotificationChannelId: 'com.example.the_quran.channel.audio',
        androidNotificationChannelName: 'Audio Playback',
        androidNotificationOngoing: true,
      ),
    );
    getIt.registerLazySingleton(() => LocalizationsCubit());

    /// Repositorys
    getIt.registerFactory(() => SurahRepo());
    getIt.registerFactory(() => JuzeRepo());
    getIt.registerFactory(() => HizbRepo());
    getIt.registerFactory(() => QuranViewRepo());
    getIt.registerFactory(() => AudioPlayerRepo());
    getIt.registerFactory(() => ReadingRepo());

    ///
    ///
    getIt.registerLazySingleton(() => QuranViewCubit(getIt()));
    getIt.registerLazySingleton(() => PlayReadsQuranCubit());
    getIt.registerLazySingleton(() => AudioPlayerCubit(getIt(), getIt()));
    getIt.registerLazySingleton(() => QuranSearchCubit());

    getIt.registerLazySingleton(() => ThemeCubit());

    getIt.registerLazySingleton(() => MainCubit());
    getIt.registerLazySingleton(
        () => QuranCubit(getIt(), getIt(), getIt(), getIt()));

    getIt.registerSingleton<AudioPlayerHandler>(audioHandler);
  }
}
