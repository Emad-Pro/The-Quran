import 'package:flutter/material.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/methods/convert_number_to_arabic.dart';
import '../../../../core/responsive/responsive_text.dart';
import '../../data/model/ayat_model/verse.dart';
import 'ayat_view_option_ayah_custom_button.dart';

class AyatViewBuildAyatItem extends StatelessWidget {
  const AyatViewBuildAyatItem({super.key, required this.verse});
  final Verse verse;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 5.0, bottom: 5, end: 15),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).brightness == Brightness.dark
                  ? ColorsConst.darkDartDarkBlue
                  : ColorsConst.darkDartDarkBlue.withOpacity(0.05),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: ColorsConst.pinkTwo,
                  child: Text(
                    convertNumberToArabic(verse.id.toString()),
                    style: TextStyle(
                        color: ColorsConst.white,
                        fontFamily: "amiri",
                        fontSize: getResponsiveFontSize(
                          context,
                          fontSize: 14,
                        )),
                  ),
                ),
                const Spacer(),
                AyatViewOptionAyahCustomButton(
                  svgPath: "assets/images/svg/share.svg",
                  onPressed: () {},
                ),
                AyatViewOptionAyahCustomButton(
                  svgPath: "assets/images/svg/play.svg",
                  onPressed: () {},
                ),
                AyatViewOptionAyahCustomButton(
                  svgPath: "assets/images/svg/mark.svg",
                  onPressed: () {},
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      verse.text!,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize:
                              getResponsiveFontSize(context, fontSize: 20),
                          fontFamily: "quran",
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    verse.transliteration!,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontFamily: "poppins"),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
