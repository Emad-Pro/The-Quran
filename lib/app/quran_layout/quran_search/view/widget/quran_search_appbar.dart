import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:the_quran/core/localizations/localizations_service.dart';

import '../../../../../core/get_it/service_locator.dart';
import '../../presenter/cubit/quran_search_cubit.dart';

AppBar quranSearchAppBar(BuildContext context) {
  return AppBar(
      title: AnimatedSearchBar(
          label: 'You can search for ayah'.tr(context),
          searchStyle: const TextStyle(),
          controller: getIt<QuranSearchCubit>().searchController,
          labelStyle: const TextStyle(fontSize: 16),
          textInputAction: TextInputAction.join,
          labelTextAlign: TextAlign.right,
          searchDecoration: InputDecoration(
            hintText: 'Search for any ayah'.tr(context),
            border: InputBorder.none,
          ),
          onFieldSubmitted: (value) {
            if (value != "") {
              getIt<QuranSearchCubit>().searchList(value);
            }
          }));
}
