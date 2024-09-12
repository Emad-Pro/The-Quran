import 'package:flutter/material.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/localizations/localizations_service.dart';
import '../../../../core/responsive/responsive_text.dart';
import '../../../../core/widget/custom_svg_image.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.title, this.leedingButton});
  final String? title;
  final Widget? leedingButton;
  @override
  Widget build(BuildContext context) {
    final isDarkModel =
        Theme.of(context).colorScheme.brightness == Brightness.dark;
    final color = isDarkModel ? ColorsConst.grayDarkPink : ColorsConst.gray;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
      child: Row(children: [
        leedingButton ??
            IconButton(
                onPressed: () {},
                icon: CustomSvgImage(
                    path: "assets/images/svg/menu.svg", color: color)),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
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
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: CustomSvgImage(
              path: "assets/images/svg/search-line 1.svg", color: color),
        ),
      ]),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 100);
}
