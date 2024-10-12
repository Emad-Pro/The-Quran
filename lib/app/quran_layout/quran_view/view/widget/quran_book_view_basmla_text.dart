import 'package:flutter/material.dart';

import '../../../../../core/responsive/responsive_text.dart';
import '../../../../../core/public/repo_quran/model/quran_view_model/quran_view_model.dart';

class QuranBookViewBasmlaText extends StatelessWidget {
  const QuranBookViewBasmlaText({super.key, required this.value});
  final QuranViewModel value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: SizedBox(
          width: double.infinity,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              locale: Locale("ar"),
              text: (value.suraNo != 9
                  ? "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ"
                  : ""), // اسم لسورةا
              style: TextStyle(
                fontFamily: "quran",
                height: -1,
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: getResponsiveFontSize(context, fontSize: 18),
                fontWeight: FontWeight.w900, // لجعل اسم السورة بارزاً
                // لضبط المسافة بين الأسطر
              ),
            ),
          )),
    );
  }
}
