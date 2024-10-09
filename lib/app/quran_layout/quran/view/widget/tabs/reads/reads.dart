import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_quran/app/quran_layout/quran/presenter/cubit/quran_cubit.dart';
import 'package:the_quran/core/const/colors.dart';
import 'package:the_quran/core/enum_state/request_state.dart';

import '../../../../../../../core/get_it/service_locator.dart';
import '../../../../../reads_view/view/reads_screen.dart';

class ReadsList extends StatelessWidget {
  const ReadsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      bloc: getIt<QuranCubit>(),
      builder: (context, state) {
        switch (state.readsState) {
          case RequestState.loading:
            return const Center(child: CircularProgressIndicator());
          case RequestState.success:
            return Directionality(
              textDirection: TextDirection.rtl,
              child: ListView(
                children: state.readsModel!.reads!
                    .map((toElement) => Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12)),
                          child: ExpansionTile(
                            title: Text(toElement.name!),
                            leading: Image.asset(
                              "assets/images/png/man.png",
                              width: 25,
                              height: 25,
                            ),
                            children: toElement.moshaf!
                                .map((moshaf) => Container(
                                      padding: EdgeInsets.all(5),
                                      margin: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface
                                              .withOpacity(0.07)),
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(12),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ReadsScreen(
                                                          moshafName: toElement
                                                              .name!,
                                                          readsName:
                                                              toElement.name!,
                                                          moshaf: moshaf,
                                                          surahName: state
                                                              .surahModel!
                                                              .data!)));
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 7),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          width: double.infinity,
                                          child: ListTile(
                                              leading: Image.asset(
                                                "assets/images/png/book.png",
                                                width: 25,
                                                height: 25,
                                              ),
                                              title: Text(moshaf.name!)),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ))
                    .toList(),
              ),
            );
          case RequestState.error:
            return ElevatedButton(
                onPressed: () {
                  getIt<QuranCubit>().getRead();
                },
                child: const Text("Reload"));
        }
      },
    );
  }
}
