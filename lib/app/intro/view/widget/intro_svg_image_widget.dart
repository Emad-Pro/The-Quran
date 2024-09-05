import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IntroSvgImageWidget extends StatelessWidget {
  const IntroSvgImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: SvgPicture.asset(
          "assets/images/svg/intro.svg",
          height: MediaQuery.sizeOf(context).height * 0.58,
        ));
  }
}
