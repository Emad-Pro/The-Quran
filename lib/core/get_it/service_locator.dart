import 'package:get_it/get_it.dart';

import '../localizations/cubit/localizations_cubit.dart';
import '../theme/cubit/theme_cubit.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    getIt.registerLazySingleton(() => ThemeCubit());
    getIt.registerLazySingleton(() => LocalizationsCubit());
  }
}
