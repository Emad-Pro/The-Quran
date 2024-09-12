import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../const/colors.dart';
import '../methods/convert_number_to_arabic.dart';
import '../responsive/responsive_text.dart';

class CustomArabicNumberWidget extends StatelessWidget {
  const CustomArabicNumberWidget({super.key, required this.number});
  final num number;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          "assets/images/svg/ayah_num.svg",
          width: 40, height: 40,
          fit: BoxFit.cover, // Adjust this as needed
        ),
        SizedBox(
          width: 40,
          height: 40,
          child: Center(
            child: Text(
              convertNumberToArabic(number.toString()),
              style: TextStyle(
                locale: const Locale("ar"),
                color: Theme.of(context).brightness == Brightness.dark
                    ? ColorsConst.white
                    : ColorsConst.darkDartDarkBlue,
                fontWeight: FontWeight.bold,
                fontFamily: "amiri",
                fontSize: getResponsiveFontSize(context,
                    fontSize:
                        number > 99 ? 12 : 14), // Adjust the size as needed
              ),
            ),
          ),
        ),
      ],
    );
  }
}
