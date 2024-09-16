import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_quran/app/quran/presenter/cubit/quran_cubit.dart';
import 'package:the_quran/core/enum_state/request_state.dart';
import 'package:the_quran/core/localizations/cubit/localizations_cubit.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/get_it/service_locator.dart';
import '../../../../core/localizations/localizations_service.dart';
import '../../../../core/responsive/responsive_text.dart';
import '../../../../core/widget/custom_svg_image.dart';
import '../../../last_read/last_read_screen.dart';

class QuranLastReadCardWidget extends StatelessWidget {
  const QuranLastReadCardWidget({super.key, required this.state});
  final QuranState state;
  @override
  Widget build(BuildContext context) {
    final fontFamily =
        LocalizationsService.locale.languageCode == 'ar' ? "amiri" : "poppins";
    final loadingState = (state.surahState == RequestState.loading &&
        state.juzeState == RequestState.loading);
    final title = loadingState
        ? "Loading ...".tr(context)
        : state.isJuze!
            ? state.juzeNumberModel!.quranJuze![state.juzeId! - 1].name!
            : state.surahModel!.data![state.lastSurah! - 1].name!;
    return BlocBuilder<LocalizationsCubit, LocalizationsState>(
      bloc: getIt<LocalizationsCubit>(),
      builder: (context, localeState) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LastReadScreen(
                        id: state.isJuze == true
                            ? state.juzeId!
                            : state.lastSurah!,
                        name: title,
                        isJuze: state.isJuze!,
                        lastPositionSaved: state.lastPositionSaved)));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  Transform(
                    transform: Matrix4.identity()
                      ..scale(
                          localeState.locale.languageCode == "ar" ? -1.0 : 1.0,
                          1.0),
                    alignment: AlignmentDirectional.center,
                    child: const SizedBox(
                      width: double.infinity,
                      height: 170,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: CustomSvgImage(
                          path: "assets/images/svg/moshaf.svg",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CustomSvgImage(
                                path: "assets/images/svg/readme.svg"),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(
                              "Last Read".tr(context),
                              style: TextStyle(
                                  fontSize: getResponsiveFontSize(context,
                                      fontSize: 12),
                                  fontWeight: FontWeight.w600,
                                  color: ColorsConst.white),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, bottom: 5),
                          child: Text(
                            title,
                            style: TextStyle(
                                fontSize: getResponsiveFontSize(context,
                                    fontSize: 20),
                                fontWeight: FontWeight.w900,
                                fontFamily: "quran",
                                color: ColorsConst.white),
                          ),
                        ),
                        if (!loadingState)
                          Builder(builder: (context) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (state.isJuze!)
                                  Text(
                                    "${"Surah :".tr(context)} ${state.surahModel!.data![state.lastSurah! - 1].name!}",
                                    style: TextStyle(
                                        fontSize: getResponsiveFontSize(context,
                                            fontSize: 16),
                                        fontFamily: "quran",
                                        color: ColorsConst.white),
                                  ),
                                Text(
                                  "${"Ayah No:".tr(context)} ${state.lastAyah!.toString()}",
                                  style: TextStyle(
                                      fontSize: getResponsiveFontSize(context,
                                          fontSize: 14),
                                      fontFamily: fontFamily,
                                      color: ColorsConst.white),
                                ),
                              ],
                            );
                          }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
