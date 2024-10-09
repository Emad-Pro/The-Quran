import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:the_quran/core/localizations/localizations_service.dart';

import '../../../../../core/const/colors.dart';
import '../../../../../core/get_it/service_locator.dart';
import '../../../../../core/public/audio_player/presenter/cubit/audio_player_cubit.dart';
import '../../../../../core/public/audio_player/view/audio_player_screen.dart';
import '../../../../../core/responsive/responsive_text.dart';
import '../../presenter/cubit/quran_search_cubit.dart';

class QuranSearchBody extends StatelessWidget {
  const QuranSearchBody({super.key, required this.state});
  final QuranSearchState state;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: state.quranSearchResult!
              .map((toElement) => Directionality(
                    textDirection: TextDirection.rtl,
                    child: Card(
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        trailing: PopupMenuButton<String>(
                          onSelected: (String value) {},
                          icon: const Icon(Icons.menu),
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              child: Row(
                                children: [
                                  const Icon(Icons.share),
                                  const SizedBox(width: 7),
                                  Text("Share".tr(context)),
                                ],
                              ),
                              onTap: () async {
                                await Share.share(toElement.suraNameAr!,
                                    subject: toElement.ayaText!);
                              },
                            ),
                            PopupMenuItem<String>(
                              child: Row(
                                children: [
                                  const Icon(Icons.play_arrow),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Text("Play".tr(context)),
                                ],
                              ),
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) =>
                                        AudioPlayerBottomSheet(
                                            value: toElement)).then((onValue) {
                                  getIt<AudioPlayerCubit>().stop();
                                });
                              },
                            ),
                          ],
                        ),
                        title: Text(
                          "سُورَةُ ${toElement.suraNameAr!}",
                          style: const TextStyle(
                              color: ColorsConst.pruble,
                              fontWeight: FontWeight.bold,
                              fontFamily: "quran"),
                        ),
                        subtitle: Text(
                          toElement.ayaText!,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize:
                                  getResponsiveFontSize(context, fontSize: 18),
                              fontFamily: "quran"),
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ));
  }
}
