import 'package:get_it/get_it.dart';
import 'package:the_quran/app/quran/presenter/cubit/quran_cubit.dart';

import '../../app/main/presenter/cubit/main_cubit.dart';
import '../localizations/cubit/localizations_cubit.dart';
import '../theme/cubit/theme_cubit.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    getIt.registerLazySingleton(() => ThemeCubit());
    getIt.registerLazySingleton(() => LocalizationsCubit());
    getIt.registerLazySingleton(() => MainCubit());
    getIt.registerLazySingleton(() => QuranCubit());
  }
}
