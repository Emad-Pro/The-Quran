import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:the_quran/core/enum_state/request_state.dart';

import '../../../../../core/get_it/service_locator.dart';

import '../../../presenter/cubit/quran_cubit.dart';
import 'juze/juze_list_view_item.dart';

class JuzList extends StatelessWidget {
  const JuzList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      bloc: getIt<QuranCubit>(),
      builder: (BuildContext context, QuranState state) {
        switch (state.juzeState) {
          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case RequestState.success:
            return JuzeListView(state: state);
          case RequestState.error:
            return const Center(
              child: Text(""),
            );
        }
      },
    );
  }
}
