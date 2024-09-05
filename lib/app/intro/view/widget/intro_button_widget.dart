import 'package:flutter/material.dart';
import 'package:the_quran/core/localizations/localizations_service.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/responsive/responsive_text.dart';

class IntroButtonWidget extends StatelessWidget {
  const IntroButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            decoration: BoxDecoration(
                color: ColorsConst.orangeDark,
                borderRadius: BorderRadius.circular(20)),
            child: Center(
                child: Text(
              "Get Started".tr(context),
              style: TextStyle(
                  color: Theme.of(context).colorScheme.surface,
                  fontWeight: FontWeight.w600,
                  fontSize: getResponsiveFontSize(context, fontSize: 20)),
            )),
          ),
        ),
      ),
    );
  }
}
