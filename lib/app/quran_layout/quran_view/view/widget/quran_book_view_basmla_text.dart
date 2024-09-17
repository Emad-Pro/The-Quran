import 'package:flutter/material.dart';

import '../../../../../core/responsive/responsive_text.dart';
import '../../../../../core/public/repo_quran/model/quran_view_model/quran_view_model.dart';

class QuranBookViewBasmlaText extends StatelessWidget {
  const QuranBookViewBasmlaText({super.key, required this.value});
  final QuranViewModel value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: (value.suraNo != 9
                ? "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ"
                : ""), // اسم لسورةا
            style: TextStyle(
              fontFamily: "quran",
              height: -2,
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: getResponsiveFontSize(context, fontSize: 16),
              fontWeight: FontWeight.bold, // لجعل اسم السورة بارزاً
              // لضبط المسافة بين الأسطر
            ),
          ),
        ));
  }
}
