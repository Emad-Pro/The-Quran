import 'package:flutter/material.dart';

import '../../../../core/const/colors.dart';
import '../../../main/view/widget/custom_appbar.dart';

CustomAppBar quranViewAppBar(BuildContext context) {
  return CustomAppBar(
    title: "Al - Fatiha",
    leedingButton: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back_ios_new_sharp,
        color: Theme.of(context).brightness == Brightness.dark
            ? ColorsConst.grayDarkPink
            : ColorsConst.gray,
      ),
    ),
  );
}
