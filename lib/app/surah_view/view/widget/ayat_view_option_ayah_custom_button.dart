import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_quran/core/const/colors.dart';

class AyatViewOptionAyahCustomButton extends StatelessWidget {
  const AyatViewOptionAyahCustomButton(
      {super.key, this.onPressed, required this.svgPath});
  final void Function()? onPressed;
  final String svgPath;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          width: 18,
          height: 18,
          svgPath,
          colorFilter:
              const ColorFilter.mode(ColorsConst.pinkTwo, BlendMode.srcIn),
        ));
  }
}
