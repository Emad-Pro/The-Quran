import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_quran/app/main/view/widget/custom_appbar.dart';
import 'package:the_quran/core/const/colors.dart';
import 'package:the_quran/core/enum_state/request_state.dart';
import 'package:the_quran/core/responsive/responsive_text.dart';

import '../../../core/get_it/service_locator.dart';
import '../data/model/quran_page_model/quran_page_model.dart';
import '../presenter/cubit/quran_page_cubit.dart';

class QuranPageScreen extends StatelessWidget {
  const QuranPageScreen({Key? key, this.juzzNumber, required this.juzeName})
      : super(key: key);
  final int? juzzNumber;
  final String juzeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: juzeName,
        leedingButton: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: BlocBuilder<QuranPageCubit, QuranPageState>(
          bloc: getIt<QuranPageCubit>()..getJuzeView(juzzNumber!),
          builder: (context, state) {
            switch (state.quranViewState) {
              case RequestState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case RequestState.success:
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: SingleChildScrollView(
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
                                      child: QuranPageSurahNameText(
                                        value: toElement,
                                      )),
                                  WidgetSpan(
                                      child: QuranPageBasmlaText(
                                    value: toElement,
                                  )),
                                  quranPageAyatText(toElement, context),
                                ],
                              );
                            } else {
                              return quranPageAyatText(toElement, context);
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
              case RequestState.error:
                return const Text("asdasdasdas");
            }
          }),
    );
  }

  TextSpan quranPageAyatText(QuranPageModel toElement, BuildContext context) {
    return TextSpan(
      text: "${toElement.ayaText!} ",
      style: TextStyle(
        fontFamily: "quran",
        color: Theme.of(context).colorScheme.onSurface,
        fontWeight: FontWeight.w500,
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        height: 2,
      ),
    );
  }
}

class QuranPageBasmlaText extends StatelessWidget {
  const QuranPageBasmlaText({super.key, required this.value});
  final QuranPageModel value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: (value.suraNo != 9
                ? "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ"
                : ""), // اسم السورة
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

class QuranPageSurahNameText extends StatelessWidget {
  const QuranPageSurahNameText({super.key, required this.value});
  final QuranPageModel value;
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
