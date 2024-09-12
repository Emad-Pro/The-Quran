import 'package:flutter/material.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/responsive/responsive_text.dart';
import 'quran_view_option_ayah_custom_button.dart';

class QuranViewBuildAyatItem extends StatelessWidget {
  const QuranViewBuildAyatItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
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
                    "100",
                    style: TextStyle(
                        color: ColorsConst.white,
                        fontSize: getResponsiveFontSize(context, fontSize: 14)),
                  ),
                ),
                const Spacer(),
                QuranViewOptionsAyahCustomButton(
                  svgPath: "assets/images/svg/share.svg",
                  onPressed: () {},
                ),
                QuranViewOptionsAyahCustomButton(
                  svgPath: "assets/images/svg/play.svg",
                  onPressed: () {},
                ),
                QuranViewOptionsAyahCustomButton(
                  svgPath: "assets/images/svg/mark.svg",
                  onPressed: () {},
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: const Column(
              children: [
                Text("[All] praise is [due] to Allah, Lord of the worlds -"),
                Text("[All] praise is [due] to Allah, Lord of the worlds -")
              ],
            ),
          )
        ],
      ),
    );
  }
}
