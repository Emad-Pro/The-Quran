import 'package:flutter/material.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/localizations/localizations_service.dart';
import '../../../../core/responsive/responsive_text.dart';

class QuranTitleAndSubtitleWidget extends StatelessWidget {
  const QuranTitleAndSubtitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final fontFamily =
        LocalizationsService.locale.languageCode == 'ar' ? "amiri" : "poppins";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Asslamualaikum",
          style: TextStyle(
              fontFamily: fontFamily,
              fontSize: getResponsiveFontSize(context, fontSize: 20),
              fontWeight: FontWeight.w500,
              color:
                  Theme.of(context).colorScheme.brightness == Brightness.light
                      ? ColorsConst.gray
                      : ColorsConst.grayDarkPink),
        ),
        Text(
          "Emad Younis",
          style: TextStyle(
              fontFamily: fontFamily,
              fontSize: getResponsiveFontSize(context, fontSize: 24),
              fontWeight: FontWeight.w600,
              color:
                  Theme.of(context).colorScheme.brightness == Brightness.light
                      ? ColorsConst.darkDarkBlue
                      : ColorsConst.white),
        )
      ],
    );
  }
}
