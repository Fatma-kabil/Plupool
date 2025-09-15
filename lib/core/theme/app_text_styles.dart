import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';

class AppTextStyles {
  static TextStyle styleBold20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: SizeConfig.isWideScreen ? 35 : 20,
      ),
      fontWeight: FontWeight.w700,
      color: Color(0xffF6F6F6),
    );
  }

  static TextStyle styleSemiBold20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: SizeConfig.isWideScreen ? 34 : 20,
      ),
      fontWeight: FontWeight.w600,
      color: Color(0xffFFFFFF),
    );
  }
   static TextStyle styleSemiBold16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: SizeConfig.isWideScreen ? 32 : 16,
      ),
      fontWeight: FontWeight.w600,
      color: Color(0xff525252),
    );
  }

  static TextStyle styleMedium20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: SizeConfig.isWideScreen ? 30 : 20,
      ),
      fontWeight: FontWeight.w500,
      color: Color(0xff333333),
      height: 1.65,
    );
  }
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;

  if (width < 800) {
    return width / 450;
  } else {
    return width / 50;
  }
}
