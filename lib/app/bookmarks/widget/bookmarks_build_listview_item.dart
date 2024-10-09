import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/const/colors.dart';
import '../../../core/responsive/responsive_text.dart';

class BookMarksBuildListViewItem extends StatelessWidget {
  const BookMarksBuildListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
      onTap: () {},
      dense: true,
      title: Text(
        "My Favorite",
        style: TextStyle(
            fontFamily: "poppins",
            color: Theme.of(context).brightness == Brightness.dark
                ? ColorsConst.white
                : ColorsConst.darkDartDarkBlue,
            fontSize: getResponsiveFontSize(context, fontSize: 16)),
      ),
      subtitle: Text("8 items",
          style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? ColorsConst.grayDarkPink
                  : ColorsConst.gray,
              fontFamily: "poppins",
              fontSize: getResponsiveFontSize(context, fontSize: 12))),
      trailing: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/images/svg/dot_menu.svg",
            colorFilter: ColorFilter.mode(
                Theme.of(context).brightness == Brightness.dark
                    ? ColorsConst.white
                    : ColorsConst.darkDartDarkBlue,
                BlendMode.srcIn),
          )),
      minVerticalPadding: 0,
      contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      leading: SvgPicture.asset("assets/images/svg/folder.svg"),
    );
  }
}
