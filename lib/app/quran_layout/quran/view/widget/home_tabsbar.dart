import 'package:flutter/material.dart';
import 'package:the_quran/core/localizations/localizations_service.dart';

import '../../../../../core/get_it/service_locator.dart';
import '../../presenter/cubit/quran_cubit.dart';

class HomeTabsBar extends StatelessWidget {
  final int currenIndex;

  const HomeTabsBar({super.key, required this.currenIndex});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
            controller: getIt<QuranCubit>().tabController(context),
            indicatorColor: Colors.purple,
            onTap: (val) {
              getIt<QuranCubit>().toggleTabs(val);
            },
            labelColor: Colors.purple,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(
                fontFamily: LocalizationsService.locale.languageCode == "ar"
                    ? "changa"
                    : ""),
            tabs: getIt<QuranCubit>().quranTabbar(context)),
        const SizedBox(height: 16),
        Expanded(
          child: TabBarView(
            controller: getIt<QuranCubit>().tabController(context),
            children: getIt<QuranCubit>().tabBarPages,
          ),
        )
      ],
    );
  }
}
