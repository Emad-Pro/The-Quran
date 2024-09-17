import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_quran/app/quran_layout/quran/presenter/cubit/quran_cubit.dart';

import 'package:the_quran/app/quran_layout/quran/view/widget/quran_title_and_subtitle.dart';
import 'package:the_quran/app/quran_layout/quran/view/widget/quran_last_read_card_widget.dart';

import '../../../../core/get_it/service_locator.dart';
import 'widget/home_tabsbar.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      bloc: getIt<QuranCubit>(),
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const QuranTitleAndSubtitleWidget(),
            QuranLastReadCardWidget(state: state),
            HomeTabsBar(
              currenIndex: state.currenIndex,
            ),
          ],
        );
      },
    );
  }
}
