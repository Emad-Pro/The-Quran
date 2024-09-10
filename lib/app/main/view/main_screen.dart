import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_quran/core/const/colors.dart';
import '../../../core/get_it/service_locator.dart';
import '../presenter/cubit/main_cubit.dart';
import 'widget/custom_appbar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      bloc: getIt<MainCubit>(),
      builder: (context, state) {
        final cubit = getIt<MainCubit>();
        return Scaffold(
          appBar: CustomAppBar(
            title: getIt<MainCubit>().appbarTitle[state.selectedIndex],
          ),
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: cubit.pages[state.selectedIndex]),
          bottomNavigationBar: BottomBarBubble(
            items: cubit.bottomNavibarItem,
            selectedIndex: state.selectedIndex,
            color: ColorsConst.pink,
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? ColorsConst.darkDartDarkBlue
                : ColorsConst.white,
            onSelect: (value) {
              cubit.toggleNavBar(value);
            },
          ),
        );
      },
    );
  }
}
