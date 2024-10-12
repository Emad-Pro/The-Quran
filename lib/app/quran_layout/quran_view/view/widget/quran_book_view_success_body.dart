import 'package:flutter/material.dart';
import 'package:the_quran/app/quran_layout/quran/presenter/cubit/quran_cubit.dart';
import 'package:the_quran/core/const/colors.dart';
import 'package:the_quran/core/localizations/localizations_service.dart';
import 'package:the_quran/core/responsive/responsive_text.dart';

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
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
                border: Border.all(color: ColorsConst.darkBlue, width: 2),
                borderRadius: BorderRadius.circular(12)),
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            margin: EdgeInsets.all(2),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    controller: getIt<QuranViewCubit>().scrollController,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          children: state.quranPageModel!.map((toElement) {
                            if (toElement.ayaNo == 1) {
                              return TextSpan(
                                locale: Locale("ar"),
                                text: "\n",
                                children: [
                                  WidgetSpan(
                                      child: QuranBookViewSurahNameText(
                                    value: toElement,
                                  )),
                                  WidgetSpan(
                                      child: QuranBookViewBasmlaText(
                                    value: toElement,
                                  )),
                                  quranBookViewAyatText(
                                      toElement, context, isJuze),
                                ],
                              );
                            } else {
                              return quranBookViewAyatText(
                                  toElement, context, isJuze);
                            }
                          }).toList(),
                        ),
                        textAlign: TextAlign.justify,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: (state.quranPageModel![0].suraNo == 114 ||
                                  (state.quranPageModel![0].jozz == 30 &&
                                      isJuze == true))
                              ? null
                              : () {
                                  if (isJuze) {
                                    getIt<QuranViewCubit>().getQuranOption(
                                        (state.quranPageModel![0].jozz! + 1)
                                            .toInt(),
                                        isJuze);
                                  } else {
                                    getIt<QuranViewCubit>().getQuranOption(
                                        (state.quranPageModel![0].suraNo! + 1)
                                            .toInt(),
                                        isJuze);
                                  }
                                },
                          child: Text("Next".tr(context))),
                      if (isJuze == true)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            getIt<QuranCubit>()
                                .getJuzeNameByNumber(
                                    state.quranPageModel![0].jozz!.toInt())
                                .toString(),
                            style: TextStyle(
                                fontFamily: "quran",
                                fontSize: getResponsiveFontSize(context,
                                    fontSize: 18)),
                          ),
                        ),
                      if (isJuze == false)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            getIt<QuranCubit>()
                                .getSurahNameByNumber(
                                    state.quranPageModel![0].suraNo!.toInt())
                                .toString(),
                            style: TextStyle(
                                fontFamily: "quran",
                                fontSize: getResponsiveFontSize(context,
                                    fontSize: 18)),
                          ),
                        ),
                      ElevatedButton(
                          onPressed: (state.quranPageModel![0].suraNo == 1 ||
                                  (state.quranPageModel![0].jozz == 1 &&
                                      isJuze == true))
                              ? null
                              : () {
                                  if (isJuze) {
                                    getIt<QuranViewCubit>().getQuranOption(
                                        (state.quranPageModel![0].jozz! - 1)
                                            .toInt(),
                                        isJuze);
                                  } else {
                                    getIt<QuranViewCubit>().getQuranOption(
                                        (state.quranPageModel![0].suraNo! - 1)
                                            .toInt(),
                                        isJuze);
                                  }
                                },
                          child: Text("Last".tr(context)))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
