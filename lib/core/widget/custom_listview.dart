import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_quran/core/const/colors.dart';

import '../../app/quran_view/view/quran_view.dart';
import '../responsive/responsive_text.dart';

class CustomListView extends StatelessWidget {
  final int index;
  final String surah;
  final String location;
  final String arabicName;

  const CustomListView({
    super.key,
    required this.index,
    required this.surah,
    required this.location,
    required this.arabicName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => QuranView()));
      },
      child: ListTile(
        leading: Stack(
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
                  '$index',
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? ColorsConst.white
                        : ColorsConst.darkDartDarkBlue,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                    fontSize: getResponsiveFontSize(context,
                        fontSize:
                            index > 99 ? 12 : 14), // Adjust the size as needed
                  ),
                ),
              ),
            ),
          ],
        ),
        title: Text(
          surah,
          style: TextStyle(
            fontFamily: "Poppins",
            color: Theme.of(context).brightness == Brightness.dark
                ? ColorsConst.white
                : ColorsConst.darkDartDarkBlue,
            fontWeight: FontWeight.bold,
            fontSize: getResponsiveFontSize(context, fontSize: 15),
          ),
        ),
        subtitle: Text(
          location,
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            color: Theme.of(context).brightness == Brightness.dark
                ? ColorsConst.grayDarkPink
                : ColorsConst.gray,
            fontSize: getResponsiveFontSize(context, fontSize: 13),
          ),
        ),
        trailing: Text(
          arabicName,
          style: TextStyle(
            fontFamily: "amiri",
            fontWeight: FontWeight.bold,
            color: ColorsConst.pink,
            fontSize: getResponsiveFontSize(context, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
