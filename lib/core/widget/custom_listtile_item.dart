import 'package:flutter/material.dart';

import '../../app/quran_view/view/quran_book_view_screen.dart';
import '../const/colors.dart';
import '../responsive/responsive_text.dart';
import 'custom_arabic_number_widget.dart';

class CustomListTileItem extends StatelessWidget {
  const CustomListTileItem({
    super.key,
    required this.arName,
    required this.enName,
    required this.number,
  });

  final String arName;
  final String enName;
  final num number;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => QuranBookViewScreen(
                        isJuze: true,
                        name: arName,
                        id: int.parse(number.toString()),
                      )));
        },
        leading: CustomArabicNumberWidget(number: number),
        trailing: Text(
          arName,
          style: TextStyle(
            fontFamily: "amiri",
            fontWeight: FontWeight.bold,
            color: ColorsConst.pink,
            fontSize: getResponsiveFontSize(context, fontSize: 16),
          ),
        ),
        title: Text(enName,
            style: TextStyle(
              fontFamily: "Poppins",
              color: Theme.of(context).brightness == Brightness.dark
                  ? ColorsConst.white
                  : ColorsConst.darkDartDarkBlue,
              fontWeight: FontWeight.bold,
              fontSize: getResponsiveFontSize(context, fontSize: 11),
            )));
  }
}
