import 'package:get_it/get_it.dart';
import 'package:the_quran/app/quran_layout/quran/data/repo/surah_repo.dart';
import 'package:the_quran/app/quran_layout/quran/presenter/cubit/quran_cubit.dart';

import 'package:the_quran/core/public/audio_player/data/repo/audio_player_repo.dart';

import '../../app/main/presenter/cubit/main_cubit.dart';
import '../../app/quran_layout/quran/data/repo/hizb_repo.dart';
import '../../app/quran_layout/quran/data/repo/juze_repo.dart';
import '../public/repo_quran/quran_view_repo/quran_view_repo.dart';
import '../../app/quran_layout/quran_view/presenter/cubit/quran_view_cubit.dart';

import '../public/audio_player/presenter/cubit/audio_player_cubit.dart';
import '../localizations/cubit/localizations_cubit.dart';
import '../theme/cubit/theme_cubit.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    /// Repositorys
    getIt.registerFactory(() => SurahRepo());
    getIt.registerFactory(() => JuzeRepo());

    getIt.registerFactory(() => HizbRepo());
    getIt.registerFactory(() => QuranViewRepo());
    getIt.registerFactory(() => AudioPlayerRepo());

    ///
    ///
    getIt.registerLazySingleton(() => QuranViewCubit(getIt()));
    getIt.registerLazySingleton(() => AudioPlayerCubit(getIt()));
    getIt.registerLazySingleton(() => ThemeCubit());
    getIt.registerLazySingleton(() => LocalizationsCubit());
    getIt.registerLazySingleton(() => MainCubit());
    getIt.registerLazySingleton(() => QuranCubit(getIt(), getIt(), getIt()));
  }
}
