import 'package:flutter/material.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/localizations/localizations_service.dart';
import '../../../../core/responsive/responsive_text.dart';
import '../../../../core/widget/custom_svg_image.dart';

class QuranLastReadCardWidget extends StatelessWidget {
  const QuranLastReadCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final fontFamily =
        LocalizationsService.locale.languageCode == 'ar' ? "amiri" : "poppins";
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            Transform(
              transform: Matrix4.identity()
                ..scale(
                    LocalizationsService.locale.languageCode == 'ar'
                        ? -1.0
                        : 1.0,
                    1.0),
              alignment: AlignmentDirectional.topStart,
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
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
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
                        "Last Read",
                        style: TextStyle(
                            fontSize:
                                getResponsiveFontSize(context, fontSize: 12),
                            fontWeight: FontWeight.w600,
                            color: ColorsConst.white),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 5),
                    child: Text(
                      "Al-Fateha",
                      style: TextStyle(
                          fontSize:
                              getResponsiveFontSize(context, fontSize: 18),
                          fontWeight: FontWeight.w500,
                          fontFamily: fontFamily,
                          color: ColorsConst.white),
                    ),
                  ),
                  Text(
                    "Ayah No: 1",
                    style: TextStyle(
                        fontSize: getResponsiveFontSize(context, fontSize: 14),
                        fontFamily: fontFamily,
                        color: ColorsConst.white),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
