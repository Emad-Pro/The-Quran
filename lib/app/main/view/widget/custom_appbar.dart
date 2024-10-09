import 'package:flutter/material.dart';
import 'package:the_quran/app/quran_layout/quran_search/view/quran_search.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/localizations/localizations_service.dart';
import '../../../../core/responsive/responsive_text.dart';
import '../../../../core/widget/custom_svg_image.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key, this.title, this.leedingButton, this.actionButton});
  final String? title;
  final Widget? leedingButton;
  final Widget? actionButton;
  @override
  Widget build(BuildContext context) {
    final isDarkModel =
        Theme.of(context).colorScheme.brightness == Brightness.dark;
    final color = isDarkModel ? ColorsConst.grayDarkPink : ColorsConst.gray;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        leedingButton ??
            IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: CustomSvgImage(
                    path: "assets/images/svg/menu.svg", color: color)),
        const Spacer(),
        Text(
          title ?? "Quran Kareem".tr(context),
          style: TextStyle(
              color:
                  Theme.of(context).colorScheme.brightness == Brightness.light
                      ? ColorsConst.pruble
                      : Colors.white,
              fontFamily: LocalizationsService.locale.languageCode == 'ar'
                  ? "quran"
                  : "quran",
              fontSize: getResponsiveFontSize(context, fontSize: 20),
              fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const QuranSearchScreen()));
          },
          icon: const Icon(Icons.search),
        ),
        actionButton ??
            Container(
              height: 0,
            )
      ]),
    );
  }

  @override
  Size get preferredSize => const Size(20, double.maxFinite);
}
