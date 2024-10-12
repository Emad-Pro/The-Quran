import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/const/colors.dart';
import '../../../../../core/responsive/responsive_text.dart';
import '../../../../../core/public/repo_quran/model/quran_view_model/quran_view_model.dart';

class QuranBookViewSurahNameText extends StatelessWidget {
  const QuranBookViewSurahNameText({super.key, required this.value});
  final QuranViewModel value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SizedBox(
            height: 55,
            width: double.infinity,
            child: FittedBox(
                fit: BoxFit.fill,
                child: SvgPicture.asset(
                  "assets/images/svg/border_surah.svg",
                  //        colorFilter: ColorFilter.mode(BlendMode.srcIn),
                )),
          ),
          SizedBox(
            height: 90,
            child: Align(
              alignment: AlignmentDirectional.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  locale: Locale("ar"),
                  text: "سُورَةُ ${value.suraNameAr}", // اسم السورة
                  style: TextStyle(
                    height: 1.5,
                    fontFamily: "quran",
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: getResponsiveFontSize(context, fontSize: 18),
                    fontWeight: FontWeight.bold, // لجعل اسم السورة بارزاً
                    // لضبط المسافة بين الأسطر
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
