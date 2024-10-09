import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:the_quran/app/quran_layout/quran/presenter/cubit/quran_cubit.dart';
import 'package:the_quran/core/get_it/service_locator.dart';

import '../../../../../core/const/colors.dart';
import '../../../../../core/localizations/localizations_service.dart';
import '../../../../../core/responsive/responsive_text.dart';

class QuranTitleAndSubtitleWidget extends StatelessWidget {
  const QuranTitleAndSubtitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Peace be with you".tr(context),
          style: TextStyle(
              fontSize: getResponsiveFontSize(context, fontSize: 20),
              fontWeight: FontWeight.bold,fontFamily: "changa",
              color:
                  Theme.of(context).colorScheme.brightness == Brightness.light
                      ? ColorsConst.gray
                      : ColorsConst.grayDarkPink),
        ),
        Text(
          getIt<QuranCubit>().hijriDate,
          textAlign: TextAlign.justify,
          style: TextStyle(
              fontSize: getResponsiveFontSize(context, fontSize: 12),
              color:
                  Theme.of(context).colorScheme.brightness == Brightness.light
                      ? ColorsConst.darkDarkBlue
                      : ColorsConst.white),
        )
      ],
    );
  }
}
