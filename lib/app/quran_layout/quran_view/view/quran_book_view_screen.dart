import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_quran/app/main/view/widget/custom_appbar.dart';
import 'package:the_quran/core/enum_state/request_state.dart';
import '../../../../core/get_it/service_locator.dart';
import '../presenter/cubit/quran_view_cubit.dart';
import 'widget/quran_book_view_success_body.dart';

class QuranBookViewScreen extends StatelessWidget {
  const QuranBookViewScreen(
      {super.key,
      this.id,
      required this.name,
      required this.isJuze,
      this.lastPositionSaved});
  final int? id;
  final String name;
  final bool isJuze;
  final double? lastPositionSaved;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: name,
        leedingButton: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: BlocBuilder<QuranViewCubit, QuranViewState>(
          bloc: getIt<QuranViewCubit>()..getQuranOption(id!, isJuze),
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
