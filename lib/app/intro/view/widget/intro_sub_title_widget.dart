import 'package:flutter/material.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/localizations/localizations_service.dart';
import '../../../../core/responsive/responsive_text.dart';

class IntroSubTitleWidget extends StatelessWidget {
  const IntroSubTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        "Learn Quran and \n Recite once everyday".tr(context),
        textAlign: TextAlign.center,
        style: TextStyle(
            color: ColorsConst.gray,
            fontSize: getResponsiveFontSize(context, fontSize: 18),
            fontFamily: LocalizationsService.locale.languageCode == 'ar'
                ? "amiri"
                : "poppins"),
      ),
    );
  }
}
