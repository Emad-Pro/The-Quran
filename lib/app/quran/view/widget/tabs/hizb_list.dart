import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_quran/app/quran/presenter/cubit/quran_cubit.dart';
import 'package:the_quran/core/enum_state/request_state.dart';

import '../../../../../core/get_it/service_locator.dart';
import '../../../../../core/widget/custom_listtile_item.dart';

class HizbList extends StatelessWidget {
  const HizbList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      bloc: getIt<QuranCubit>(),
      builder: (context, state) {
        switch (state.hizbState) {
          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case RequestState.success:
            return ListView(
                children: state.hizbNumberModel!.quranHizb!
                    .map((toElement) => CustomListTileItem(
                          arName: toElement.name!,
                          enName: toElement.translation!,
                          number: toElement.hizbNumber!,
                        ))
                    .toList());
          case RequestState.error:
            return const Text("");
        }
      },
    );
  }
}
