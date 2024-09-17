import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_quran/app/main/view/widget/custom_appbar.dart';
import '../../../core/enum_state/request_state.dart';
import '../../../core/get_it/service_locator.dart';
import '../quran_view/presenter/cubit/quran_view_cubit.dart';
import '../quran_view/view/widget/quran_book_view_success_body.dart';

class LastReadScreen extends StatelessWidget {
  const LastReadScreen(
      {super.key,
      required this.id,
      required this.isJuze,
      required this.lastPositionSaved,
      required this.name});
  final int id;
  final bool isJuze;
  final double lastPositionSaved;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: name,
        leedingButton: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: BlocConsumer<QuranViewCubit, QuranViewState>(
          listener: (context, state) {
            if (state.quranViewState == RequestState.success) {
              getIt<QuranViewCubit>().scrollToLastPosition(lastPositionSaved);
            }
          },
          bloc: getIt<QuranViewCubit>()..getQuranOption(id, isJuze),
          builder: (context, state) {
            switch (state.quranViewState) {
              case RequestState.loading:
                return const Center(child: CircularProgressIndicator());
              case RequestState.success:
                return QuranBookViewSuccessBody(
                  isJuze: isJuze,
                  state: state,
                );
              case RequestState.error:
                return const Text("asdasdasdas");
            }
          }),
    );
  }
}
