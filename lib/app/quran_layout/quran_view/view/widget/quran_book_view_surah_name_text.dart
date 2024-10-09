import 'package:flutter/material.dart';

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
            height: 90,
            child: Align(
              alignment: AlignmentDirectional.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "سُورَةُ ${value.suraNameAr}", // اسم السورة
                  style: TextStyle(
                    height: 2.6,
                    fontFamily: "quran",
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: getResponsiveFontSize(context, fontSize: 18),
                    fontWeight: FontWeight.bold, // لجعل اسم السورة بارزاً
                    // لضبط المسافة بين الأسطر
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 90,
            width: double.infinity,
            child: FittedBox(
              fit: BoxFit.fill,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: "${39}", // اسم السورة
                  style: TextStyle(
                    color: ColorsConst.pruble,
                    fontFamily: "frame",
                    fontWeight: FontWeight.w100, // لجعل اسم السورة بارزاً
                    // لضبط المسافة بين الأسطر
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
