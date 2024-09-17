import 'package:flutter/material.dart';

import '../../../../presenter/cubit/quran_cubit.dart';

import 'juze_build_listview_item.dart';

class JuzeListView extends StatelessWidget {
  const JuzeListView({super.key, required this.state});
  final QuranState state;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.juzeNumberModel!.quranJuze!.length,
      itemBuilder: (context, index) {
        final juz = state.juzeNumberModel!.quranJuze![index];
        return JuzeBuildListviewItem(
          arName: juz.name!,
          enName: juz.translation!,
          number: juz.juzeNumber!,
        );
      },
    );
  }
}
