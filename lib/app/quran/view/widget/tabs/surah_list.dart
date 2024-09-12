import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:the_quran/app/quran/presenter/cubit/quran_cubit.dart';
import 'package:the_quran/core/enum_state/request_state.dart';
import '../../../../../core/get_it/service_locator.dart';
import 'surah/surah_list_view.dart';

class SurahList extends StatelessWidget {
  const SurahList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      bloc: getIt<QuranCubit>(),
      builder: (context, state) {
        switch (state.surahState) {
          case RequestState.loading:
            return const Center(child: CircularProgressIndicator());
          case RequestState.success:
            return SurahListview(state: state);
          case RequestState.error:
            return const Text("فشل تحميل السور");
        }
      },
    );
  }
}
