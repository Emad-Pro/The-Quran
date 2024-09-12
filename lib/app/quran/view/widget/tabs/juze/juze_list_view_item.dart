import 'package:flutter/material.dart';

import '../../../../presenter/cubit/quran_cubit.dart';

import '../../../../../../core/widget/custom_listtile_item.dart';

class JuzeListView extends StatelessWidget {
  const JuzeListView({super.key, required this.state});
  final QuranState state;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.juzeNumberModel!.quranJuze!.length,
      itemBuilder: (context, index) {
        final juz = state.juzeNumberModel!.quranJuze![index];
        return CustomListTileItem(
          arName: juz.name!,
          enName: juz.translation!,
          number: juz.juzeNumber!,
        );
      },
    );
  }
}
