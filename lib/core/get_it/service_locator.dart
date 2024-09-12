import 'package:get_it/get_it.dart';
import 'package:the_quran/app/quran/data/repo/surah_repo.dart';
import 'package:the_quran/app/quran/presenter/cubit/quran_cubit.dart';
import 'package:the_quran/app/quran_page/data/quran_page_repo/quran_page_repo.dart';
import 'package:the_quran/app/quran_page/presenter/cubit/quran_page_cubit.dart';
import 'package:the_quran/app/surah_view/presenter/cubit/ayat_cubit.dart';

import '../../app/main/presenter/cubit/main_cubit.dart';
import '../../app/quran/data/repo/hizb_repo.dart';
import '../../app/quran/data/repo/juze_repo.dart';
import '../../app/surah_view/data/repo/ayat_repo.dart';
import '../localizations/cubit/localizations_cubit.dart';
import '../theme/cubit/theme_cubit.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    /// Repositorys
    getIt.registerFactory(() => SurahRepo());
    getIt.registerFactory(() => JuzeRepo());
    getIt.registerFactory(() => AyatRepo());
    getIt.registerFactory(() => HizbRepo());
    getIt.registerFactory(() => QuranPageRepo());

    ///
    ///
    getIt.registerLazySingleton(() => QuranPageCubit(getIt()));
    getIt.registerLazySingleton(() => AyatCubit(getIt()));
    getIt.registerLazySingleton(() => ThemeCubit());
    getIt.registerLazySingleton(() => LocalizationsCubit());
    getIt.registerLazySingleton(() => MainCubit());
    getIt.registerLazySingleton(() => QuranCubit(getIt(), getIt(), getIt()));
  }
}
