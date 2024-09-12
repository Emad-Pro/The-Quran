import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/responsive/responsive_text.dart';

class QuranViewSurahDetailsCard extends StatelessWidget {
  const QuranViewSurahDetailsCard({
    super.key,
  });

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
                        "Al-Fatiah",
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
                        "Juz Number",
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
                        "Meccan • 7 Verses",
                        style: TextStyle(
                            fontSize:
                                getResponsiveFontSize(context, fontSize: 16),
                            fontFamily: "poppins",
                            color: ColorsConst.white),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
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
