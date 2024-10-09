import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_quran/app/quran_layout/quran/data/model/reads_model/moshaf.dart';
import 'package:the_quran/app/quran_layout/reads_view/presenter/cubit/play_reads_quran_cubit.dart';
import 'package:the_quran/core/enum_state/request_state.dart';
import '../../../../core/const/colors.dart';
import '../../../../core/get_it/service_locator.dart';
import '../../../../core/responsive/responsive_text.dart';
import '../../../../core/widget/custom_arabic_number_widget.dart';
import '../../quran/data/model/surah_model/datum.dart';
import '../../quran_audio_suwer/view/quran_audio_suwer.dart';

class ReadsScreen extends StatelessWidget {
  const ReadsScreen(
      {super.key,
      required this.moshaf,
      required this.surahName,
      required this.moshafName,
      required this.readsName});
  final Moshaf moshaf;
  final List<Datum>? surahName;
  final String moshafName;
  final String readsName;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayReadsQuranCubit, PlayReadsQuranState>(
        bloc: getIt<PlayReadsQuranCubit>()..fetchSurahName(moshaf, surahName!),
        builder: (context, state) {
          switch (state.surahPlayState) {
            case RequestState.loading:
              return const Center(child: CircularProgressIndicator());
            case RequestState.success:
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    "$moshafName ${moshaf.name}",
                    style: TextStyle(
                        fontSize: getResponsiveFontSize(
                      context,
                      fontSize: 18,
                    )),
                  ),
                ),
                body: ListView(
                    children: state.surahPlayModel!
                        .map((toElement) => InkWell(
                              onTap: () {
                                final url = getIt<PlayReadsQuranCubit>()
                                    .fetchUrlSurah(
                                        toElement.server!, toElement.id!);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => QuranAudioSuwer(
                                              surahName: toElement.name!,
                                              readsName: moshaf.name!,
                                              readsType: readsName,
                                              url: url,
                                            )));
                              },
                              child: ListTile(
                                trailing: CustomArabicNumberWidget(
                                    number: toElement.id!),
                                title: Text(
                                  toElement.name!,
                                  style: TextStyle(
                                    fontFamily: "amiri",
                                    fontWeight: FontWeight.bold,
                                    color: ColorsConst.pink,
                                    fontSize: getResponsiveFontSize(context,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ))
                        .toList()),
              );
            case RequestState.error:
              return const Text("Some Error");
          }
        });
  }
}
