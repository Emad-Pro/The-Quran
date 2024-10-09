import 'package:flutter/material.dart';

import 'intro_button_widget.dart';
import 'intro_svg_image_widget.dart';

class IntroImageButtonStackWidget extends StatelessWidget {
  const IntroImageButtonStackWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.6,
      child: const Stack(
        children: [IntroSvgImageWidget(), IntroButtonWidget()],
      ),
    );
  }
}
