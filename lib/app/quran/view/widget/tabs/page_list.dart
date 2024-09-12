import 'package:flutter/material.dart';

class PageList extends StatelessWidget {
  const PageList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        // CustomListView(
        //     index: 1,
        //     surah: 'Al-Fatiah',
        //     location: 'Meccan • 7 Verses',
        //     arabicName: 'الفاتحة'),
      ],
    );
  }
}
