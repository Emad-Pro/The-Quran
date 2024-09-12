import 'package:flutter/material.dart';

import '../../data/model/ayat_model/ayat_model.dart';
import 'ayat_view_build_ayat_item.dart';

class AyatViewListview extends StatelessWidget {
  const AyatViewListview({super.key, required this.ayatModel});
  final AyatModel ayatModel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: ayatModel.verses!.length,
            itemBuilder: (context, i) {
              return AyatViewBuildAyatItem(
                verse: ayatModel.verses![i],
              );
            }),
      ),
    );
  }
}
