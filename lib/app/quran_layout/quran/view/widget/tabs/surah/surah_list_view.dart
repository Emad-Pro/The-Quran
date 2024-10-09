import 'package:flutter/material.dart';

import '../../../../presenter/cubit/quran_cubit.dart';
import 'surah_build_listview_item.dart';

class SurahListview extends StatelessWidget {
  const SurahListview({super.key, required this.state});
  final QuranState state;
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: state.surahModel!.data!
            .map((toElement) => SurahBuildListViewItem(datum: toElement))
            .toList());
  }
}
