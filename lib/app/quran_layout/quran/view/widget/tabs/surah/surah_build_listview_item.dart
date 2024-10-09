import 'package:flutter/material.dart';
import 'package:the_quran/core/const/colors.dart';
import 'package:the_quran/core/localizations/localizations_service.dart';
import '../../../../../quran_view/view/quran_book_view_screen.dart';

import '../../../../../../../core/responsive/responsive_text.dart';
import '../../../../../../../core/widget/custom_arabic_number_widget.dart';
import '../../../../data/model/surah_model/datum.dart';

class SurahBuildListViewItem extends StatelessWidget {
  final Datum datum;
  const SurahBuildListViewItem({super.key, required this.datum});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => QuranBookViewScreen(
                    id: datum.number!, name: datum.name!, isJuze: false)));
      },
      child: ListTile(
        leading: CustomArabicNumberWidget(number: datum.number!),
        title: Text(
          datum.englishName!,
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
          datum.revelationType!.tr(context),
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
          datum.name!,
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
