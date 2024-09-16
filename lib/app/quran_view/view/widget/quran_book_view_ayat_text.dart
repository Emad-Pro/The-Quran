import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:the_quran/app/quran/presenter/cubit/quran_cubit.dart';

import '../../../../core/get_it/service_locator.dart';
import '../../../../core/responsive/responsive_text.dart';
import '../../../../core/public/repo_quran/model/quran_view_model/quran_view_model.dart';
import 'quran_book_view_ayat_button_player_audio.dart';

TextSpan quranBookViewAyatText(
    QuranViewModel toElement, BuildContext context, bool isJuze) {
  return TextSpan(
    recognizer: TapGestureRecognizer()
      ..onTap = () {
        showModalBottomSheet(
          context: context,
          builder: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  QuranBookViewAyatButtonPlayerAudio(
                    value: toElement,
                  ),
                  PopupMenuItem(
                      onTap: () async {
                        await Share.share(toElement.suraNameAr!,
                            subject: toElement.ayaText!);
                      },
                      child: SvgPicture.asset("assets/images/svg/share.svg",
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).colorScheme.onSurface,
                              BlendMode.srcIn))),
                  PopupMenuItem(
                    onTap: () {
                      getIt<QuranCubit>().saveLastReadingPosition(
                          int.parse(toElement.suraNo.toString()),
                          int.parse(toElement.ayaNo.toString()),
                          isJuze,
                          int.parse(toElement.jozz.toString()));
                    },
                    value: '/about',
                    child: SvgPicture.asset(
                      "assets/images/svg/mark.svg",
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.onSurface,
                          BlendMode.srcIn),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
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
