import 'package:flutter/material.dart';
import 'package:the_quran/core/const/colors.dart';
import '../../../../../quran_view/view/quran_book_view_screen.dart';

import '../../../../../../core/responsive/responsive_text.dart';
import '../../../../../../core/widget/custom_arabic_number_widget.dart';

class SurahBuildListViewItem extends StatelessWidget {
  final int? number;
  final String? name;
  final String? englishName;
  final String? englishNameTranslation;
  final int? numberOfAyahs;
  final String? revelationType;

  const SurahBuildListViewItem(
      {super.key,
      this.number,
      this.name,
      this.englishName,
      this.englishNameTranslation,
      this.numberOfAyahs,
      this.revelationType});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => QuranBookViewScreen(
                      id: number!,
                      name: name!,
                      isJuze: false,
                    )));
      },
      child: ListTile(
        leading: CustomArabicNumberWidget(number: number!),
        title: Text(
          englishName!,
          style: TextStyle(
            fontFamily: "Poppins",
            color: Theme.of(context).brightness == Brightness.dark
                ? ColorsConst.white
                : ColorsConst.darkDartDarkBlue,
            fontWeight: FontWeight.bold,
            fontSize: getResponsiveFontSize(context, fontSize: 14),
          ),
        ),
        subtitle: Text(
          revelationType!,
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            color: Theme.of(context).brightness == Brightness.dark
                ? ColorsConst.grayDarkPink
                : ColorsConst.gray,
            fontSize: getResponsiveFontSize(context, fontSize: 12),
          ),
        ),
        trailing: Text(
          name!,
          style: TextStyle(
            fontFamily: "amiri",
            fontWeight: FontWeight.bold,
            color: ColorsConst.pink,
            fontSize: getResponsiveFontSize(context, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
