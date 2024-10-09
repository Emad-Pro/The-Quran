import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/responsive/responsive_text.dart';

class BookMarksAddNewCollection extends StatelessWidget {
  const BookMarksAddNewCollection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                SvgPicture.asset("assets/images/svg/folder_add.svg"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Add New Collection",
                    style: TextStyle(
                        fontFamily: "poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: getResponsiveFontSize(context, fontSize: 14)),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          SvgPicture.asset("assets/images/svg/three_menu.svg"),
        ],
      ),
    );
  }
}
