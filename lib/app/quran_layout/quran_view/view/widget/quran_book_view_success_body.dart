import 'package:flutter/material.dart';

import '../../../../../core/get_it/service_locator.dart';
import '../../presenter/cubit/quran_view_cubit.dart';
import 'quran_book_view_ayat_text.dart';
import 'quran_book_view_basmla_text.dart';
import 'quran_book_view_surah_name_text.dart';

class QuranBookViewSuccessBody extends StatelessWidget {
  const QuranBookViewSuccessBody(
      {super.key, required this.state, required this.isJuze});
  final QuranViewState state;
  final bool isJuze;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        controller: getIt<QuranViewCubit>().scrollController,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
            text: TextSpan(
              children: state.quranPageModel!.map((toElement) {
                if (toElement.ayaNo == 1) {
                  return TextSpan(
                    children: [
                      WidgetSpan(
                          alignment: PlaceholderAlignment.top,
                          child: QuranBookViewSurahNameText(
                            value: toElement,
                          )),
                      WidgetSpan(
                          child: QuranBookViewBasmlaText(
                        value: toElement,
                      )),
                      quranBookViewAyatText(toElement, context, isJuze),
                    ],
                  );
                } else {
                  return quranBookViewAyatText(toElement, context, isJuze);
                }
              }).toList(),
            ),
            textAlign: TextAlign.center,
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        ),
      ),
    );
  }
}
