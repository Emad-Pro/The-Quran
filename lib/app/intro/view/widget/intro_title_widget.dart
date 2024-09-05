import 'package:flutter/material.dart';
import 'package:the_quran/core/localizations/localizations_service.dart';
import 'package:the_quran/core/responsive/responsive_text.dart';

import '../../../../core/const/colors.dart';

class IntroTitleWidget extends StatelessWidget {
  const IntroTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Quran Kareem".tr(context),
      style: TextStyle(
          color: Theme.of(context).brightness == Brightness.light
              ? ColorsConst.pruble
              : Theme.of(context).colorScheme.onSurface,
          fontSize: getResponsiveFontSize(context, fontSize: 40),
          fontWeight: FontWeight.bold,
          fontFamily: LocalizationsService.locale.languageCode == 'ar'
              ? "amiri"
              : "poppins"),
    );
  }
}
