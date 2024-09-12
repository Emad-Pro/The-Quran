import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_quran/app/surah_view/presenter/cubit/ayat_cubit.dart';
import 'package:the_quran/core/enum_state/request_state.dart';

import '../../../core/get_it/service_locator.dart';
import 'method/ayat_view_appbar.dart';
import 'widget/ayat_view_listview.dart';
import 'widget/ayat_view_surah_details_card.dart';

class AyatView extends StatelessWidget {
  const AyatView({super.key, required this.surahId, required this.surahName});
  final int surahId;
  final String surahName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: quranViewAppBar(context, surahName),
      body: BlocBuilder<AyatCubit, AyatState>(
        bloc: getIt<AyatCubit>()..getSurahWithId(surahId),
        builder: (context, state) {
          switch (state.ayatSurahState) {
            case RequestState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case RequestState.success:
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    AyatViewSurahDetailsCard(
                      ayatModel: state.ayatModel!,
                    ),
                    AyatViewListview(
                      ayatModel: state.ayatModel!,
                    ),
                  ],
                ),
              );
            case RequestState.error:
              return const Text("");
          }
        },
      ),
    );
  }
}
