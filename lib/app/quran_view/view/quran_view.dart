import 'package:flutter/material.dart';

import 'method/quran_view_appbar.dart';
import 'widget/quran_view_ayat_listview.dart';
import 'widget/quran_view_surah_details_card.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: quranViewAppBar(context),
      body: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [QuranViewSurahDetailsCard(), QuranViewAyatListView()],
        ),
      ),
    );
  }
}
