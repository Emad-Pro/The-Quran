import 'package:flutter/material.dart';

import '../../../../../core/widget/custom_listview.dart';

class HizbList extends StatelessWidget {
  const HizbList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        CustomListView(
            index: 1,
            surah: 'Al-Fatiah',
            location: 'Meccan • 7 Verses',
            arabicName: 'الفاتحة'),
      ],
    );
  }
}
