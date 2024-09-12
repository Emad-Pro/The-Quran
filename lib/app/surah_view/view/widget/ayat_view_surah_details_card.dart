import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_quran/app/surah_view/data/model/ayat_model/ayat_model.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/methods/convert_number_to_arabic.dart';
import '../../../../core/responsive/responsive_text.dart';

class AyatViewSurahDetailsCard extends StatelessWidget {
  const AyatViewSurahDetailsCard({super.key, required this.ayatModel});
  final AyatModel ayatModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 256,
          width: double.infinity,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              SizedBox(
                  height: 256,
                  width: double.infinity,
                  child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: SvgPicture.asset(
                          "assets/images/svg/card_surah_details.svg"))),
              SizedBox(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ayatModel.name!,
                        style: TextStyle(
                            fontSize:
                                getResponsiveFontSize(context, fontSize: 26),
                            fontFamily: "poppins",
                            color: ColorsConst.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        ayatModel.transliteration!,
                        style: TextStyle(
                            fontSize:
                                getResponsiveFontSize(context, fontSize: 16),
                            fontFamily: "poppins",
                            color: ColorsConst.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width / 2,
                        height: 0.5,
                        color: ColorsConst.white,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Meccan • ${convertNumberToArabic(ayatModel.totalVerses.toString())} Verses",
                        style: TextStyle(
                            fontSize:
                                getResponsiveFontSize(context, fontSize: 16),
                            fontFamily: "poppins",
                            color: ColorsConst.white),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      if (ayatModel.id != 9)
                        SvgPicture.asset("assets/images/svg/basmla.svg"),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
