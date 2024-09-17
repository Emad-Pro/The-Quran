import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:the_quran/core/bloc/bloc_observer.dart';

import 'package:the_quran/core/localizations/cubit/localizations_cubit.dart';
import 'package:the_quran/core/theme/cubit/theme_cubit.dart';
import 'package:the_quran/core/theme/service/theme_service.dart';

import 'app/intro/intro_screen.dart';
import 'core/hive_database/hive_reading_model.dart';
import 'core/public/repo_quran/quran_view_repo/quran_view_repo.dart';
import 'core/get_it/service_locator.dart';
import 'core/localizations/localizations_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  await Hive.initFlutter();
  Hive.registerAdapter(HiveReadingModelAdapter());
  await Hive.openBox<HiveReadingModel>('readingBox');

  Bloc.observer = MyBlocObserver();
  await QuranViewRepo().loadQuranData();
  ServiceLocator().init();
  runApp(DevicePreview(builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationsCubit, LocalizationsState>(
      bloc: getIt<LocalizationsCubit>(),
      builder: (context, localeizationsState) {
        final locale = localeizationsState.locale;
        return BlocBuilder<ThemeCubit, ThemeState>(
          bloc: getIt<ThemeCubit>(),
          builder: (context, themeState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              locale: locale,
              supportedLocales: const [Locale('en'), Locale('ar')],
              localizationsDelegates: const [
                LocalizationsService.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              title: 'The Quran Kareem',
              darkTheme: ThemeService.darkTheme(locale),
              theme: ThemeService.lightTheme(locale),
              themeMode: ThemeService.themeApp(),
              home: const IntroScreen(),
            );
          },
        );
      },
    );
  }
}
