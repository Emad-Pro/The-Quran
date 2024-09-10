import 'package:flutter/material.dart';

import 'quran_view_build_ayat_item.dart';

class QuranViewAyatListView extends StatelessWidget {
  const QuranViewAyatListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (context, i) => const QuranViewBuildAyatItem()),
      ),
    );
  }
}
