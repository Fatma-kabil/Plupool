import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';

class AppTextStyles {
  static TextStyle styleBold20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: SizeConfig.isWideScreen ? 28 : 20,
      ),
      fontWeight: FontWeight.w700,
      color: Color(0xffF6F6F6),
    );
  }
  static TextStyle styleBold14(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: SizeConfig.isWideScreen ? 16 : 14,
      ),
      fontWeight: FontWeight.w700,
      color: AppColors.ktextcolor,
    );
  }
   static TextStyle styleBold10(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: SizeConfig.isWideScreen ? 15 : 10,
      ),
      fontWeight: FontWeight.w700,
      color: Colors.white,
    );
  }
  static TextStyle styleBold16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: SizeConfig.isWideScreen ? 20 : 16,
      ),
      fontWeight: FontWeight.w700,
      color: AppColors.kprimarycolor,
    );
  }

  static TextStyle styleBold13(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: SizeConfig.isWideScreen ? 17 : 13,
      ),
      fontWeight: FontWeight.w700,
      color: Color(0xff999999),
    );
  }

  static TextStyle styleSemiBold20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: SizeConfig.isWideScreen ? 25 : 20,
      ),
      fontWeight: FontWeight.w600,
      color: Color(0xffFFFFFF),
    );
  }

  static TextStyle styleSemiBold16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: SizeConfig.isWideScreen ? 22 : 16,
      ),
      fontWeight: FontWeight.w600,
      color: Color(0xff525252),
    );
  }
   static TextStyle styleSemiBold13(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: SizeConfig.isWideScreen ? 17 : 13,
      ),
      fontWeight: FontWeight.w600,
     
    );
  }
   static TextStyle styleSemiBold25(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: SizeConfig.isWideScreen ? 30 : 25,
      ),
      fontWeight: FontWeight.w600,
      color: AppColors.ktextcolor,
    );
  }

  static TextStyle styleSemiBold14(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: SizeConfig.isWideScreen ? 20 : 14,
      ),
      fontWeight: FontWeight.w600,
      color: Color(0xff333333),
    );
  }

  static TextStyle styleSemiBold32(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: SizeConfig.isWideScreen ? 26 : 32,
      ),
      fontWeight: FontWeight.w600,
      color: AppColors.kprimarycolor,
    );
  }

 

  static TextStyle styleMedium20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: SizeConfig.isWideScreen ? 24 : 20,
      ),
      fontWeight: FontWeight.w500,
      color: AppColors.ktextcolor,
      height: 1.65,
    );
  }

  static TextStyle styleMedium14(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: SizeConfig.isWideScreen ? 18 : 14,
      ),
      fontWeight: FontWeight.w500,
      color: AppColors.kprimarycolor,
      height: 1.65,
    );
  }
  static TextStyle stylelight14(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: SizeConfig.isWideScreen ? 18 : 14,
      ),
      fontWeight: FontWeight.w300,
      color: Color(0xff555555),
      height: 1.5,
    );
  }

  static TextStyle styleRegular16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: SizeConfig.isWideScreen ? 20 : 16,
      ),
      fontWeight: FontWeight.w400,
      color: Color(0xff808080),
      height: 1.8
    );
  }

  static TextStyle styleRegular13(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: SizeConfig.isWideScreen ? 19 : 13,
      ),
      fontWeight: FontWeight.w400,
      color: AppColors.hintTextColor,
      height: 1.8
    );
  }

  static TextStyle styleRegular10(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: SizeConfig.isWideScreen ? 15 : 10,
      ),
      fontWeight: FontWeight.w400,
      color: Color(0xff777777),
    );
  }

  static TextStyle styleRegular14(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: SizeConfig.isWideScreen ? 18 : 14,
      ),
      fontWeight: FontWeight.w400,
      color: Color(0xff555555),
    );
  }
  
  static TextStyle styleRegular6(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: SizeConfig.isWideScreen ? 10 : 6,
      ),
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
  }

  static TextStyle styleMedium16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: SizeConfig.isWideScreen ? 20 : 16,
      ),
      fontWeight: FontWeight.w500,
      color: AppColors.kprimarycolor,
    );
  }

  static TextStyle styleMedium25(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: SizeConfig.isWideScreen ? 30 : 25,
      ),
      fontWeight: FontWeight.w500,
      color: AppColors.kprimarycolor,
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
