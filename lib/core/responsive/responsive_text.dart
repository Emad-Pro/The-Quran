import 'package:flutter/widgets.dart';

class SizeConfig {
  static const double desktop = 1200;
  static const double tablet = 650;

  static late double width, height;

  static void init(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  // قم بتحديد الحدود العليا والدنيا لتجنب أن يصبح الخط صغيرًا أو كبيرًا جدًا
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  if (width <= SizeConfig.tablet) {
    return width / 375; // تحسين تجربة الأجهزة الصغيرة
  } else if (width <= SizeConfig.desktop) {
    return width / 768; // تحسين تجربة الأجهزة المتوسطة (التابلت)
  } else {
    return width / 1440; // تحسين تجربة الأجهزة الكبيرة (الديسكتوب)
  }
}
