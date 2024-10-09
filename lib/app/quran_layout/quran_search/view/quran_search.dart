import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:the_quran/app/quran_layout/quran_search/presenter/cubit/quran_search_cubit.dart';

import 'package:the_quran/core/enum_state/request_state.dart';
import 'package:the_quran/core/localizations/localizations_service.dart';

import '../../../../core/get_it/service_locator.dart';
import 'widget/quran_search_appbar.dart';
import 'widget/quran_search_body.dart';

class QuranSearchScreen extends StatelessWidget {
  const QuranSearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranSearchCubit, QuranSearchState>(
      bloc: getIt<QuranSearchCubit>(),
      builder: (context, state) {
        return Scaffold(
            appBar: quranSearchAppBar(context),
            body: Builder(builder: (context) {
              switch (state.requestState) {
                case RequestState.loading:
                  return const Center(child: CircularProgressIndicator());
                case RequestState.success:
                  return QuranSearchBody(state: state);
                case RequestState.error:
                  return Center(
                      child: Text("There are no searches yet".tr(context)));
              }
            }));
      },
    );
  }
}
