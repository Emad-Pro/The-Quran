import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvgImage extends StatelessWidget {
  const CustomSvgImage({super.key, required this.path, this.color, this.width});
  final String path;
  final Color? color;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      width: width,
      path,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }
}
