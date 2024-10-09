import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';

import 'package:the_quran/core/const/colors.dart';
import 'package:the_quran/core/public/audio_player/presenter/cubit/audio_player_cubit.dart';
import 'package:the_quran/core/public/audio_player/view/widget/audio_player_controll_sound.dart';
import 'package:the_quran/core/theme/cubit/theme_cubit.dart';
import 'package:the_quran/core/theme/service/theme_service.dart';
import '../../../core/get_it/service_locator.dart';
import '../../../core/localizations/cubit/localizations_cubit.dart';
import '../../../core/localizations/localizations_service.dart';

import '../presenter/cubit/main_cubit.dart';
import 'widget/custom_appbar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      bloc: getIt<MainCubit>(),
      builder: (context, state) {
        final cubit = getIt<MainCubit>();
        return Scaffold(
          drawer: Drawer(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SvgPicture.asset(
                      state.imageDrawer,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.language),
                  title: Text("Language".tr(context)),
                  trailing: BlocBuilder<LocalizationsCubit, LocalizationsState>(
                    bloc: getIt<LocalizationsCubit>(),
                    builder: (context, state) {
                      return PopupMenuButton(itemBuilder: (context) {
                        final stateLanguageCode =
                            LocalizationsService.locale.languageCode == 'ar';
                        toggleColor(bool statusLanguageCode) =>
                            statusLanguageCode
                                ? Theme.of(context).colorScheme.primary
                                : null;
                        return [
                          PopupMenuItem(
                              onTap: () {
                                getIt<LocalizationsCubit>()
                                    .changeLocale(const Locale('ar'));
                              },
                              child: Text('Arabic'.tr(context),
                                  style: TextStyle(
                                      color: toggleColor(stateLanguageCode)))),
                          PopupMenuItem(
                            onTap: () {
                              getIt<LocalizationsCubit>()
                                  .changeLocale(const Locale('en'));
                            },
                            child: Text('English'.tr(context),
                                style: TextStyle(
                                    color: toggleColor(!stateLanguageCode))),
                          )
                        ];
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          appBar: CustomAppBar(
            title: getIt<MainCubit>().appbarTitle[state.selectedIndex],
            actionButton: IconButton(
                onPressed: () {
                  getIt<ThemeCubit>().toggleTheme();
                },
                icon: Icon(!ThemeService.isDarkTheme
                    ? Icons.dark_mode
                    : Icons.light_mode)),
          ),
          body: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
            Padding(
                padding: EdgeInsets.only(
                  right: 15,
                  bottom: getIt<AudioPlayerCubit>().state.isPlaying ? 56 : 0.0,
                  left: 15.0,
                ),
                child: cubit.pages[state.selectedIndex]),
            BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
                bloc: getIt<AudioPlayerCubit>(),
                builder: (context, state) {
                  print(state.isPlaying);
                  if (state.isPlaying ||
                      state.processingState == ProcessingState.completed) {
                    return Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.2)),
                            color: Theme.of(context).colorScheme.surface),
                        child: AudioPlayerControllSound(state: state));
                  } else {
                    return SizedBox();
                  }
                }),
          ]),
          bottomNavigationBar: BottomBarBubble(
            items: cubit.bottomNavibarItem,
            selectedIndex: cubit.state.selectedIndex,
            color: ColorsConst.pink,
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? ColorsConst.darkDartDarkBlue
                : ColorsConst.white,
            onSelect: (value) {
              cubit.toggleNavBar(value);
            },
          ),
        );
      },
    );
  }
}
