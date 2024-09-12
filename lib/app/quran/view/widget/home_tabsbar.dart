import 'package:flutter/material.dart';

import '../../../../core/get_it/service_locator.dart';
import '../../presenter/cubit/quran_cubit.dart';

class HomeTabsBar extends StatelessWidget {
  final int currenIndex;

  const HomeTabsBar({super.key, required this.currenIndex});
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          TabBar(
              controller: getIt<QuranCubit>().tabController(context),
              indicatorColor: Colors.purple,
              onTap: (val) {
                getIt<QuranCubit>().toggleTabs(val);
              },
              labelColor: Colors.purple,
              unselectedLabelColor: Colors.grey,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              tabs: getIt<QuranCubit>().quranTabbar),
          const SizedBox(height: 16),
          Expanded(
            child: TabBarView(
              controller: getIt<QuranCubit>().tabController(context),
              children: getIt<QuranCubit>().tabBarPages,
            ),
          )
        ],
      ),
    );
  }
}
