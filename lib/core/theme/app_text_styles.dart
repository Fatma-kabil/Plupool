import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/utils/size_config.dart';

class AppTextStyles {

   static TextStyle styleBold26(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 26),
      fontWeight: FontWeight.w700,
      color: Color(0xff141F1F),
      height: 1.65,
    );
  }
  static TextStyle styleBold22(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize:SizeConfig.isWideScreen?40: 22),
      fontWeight: FontWeight.w700,
      color: Color(0xffFFFFFF),
      height: 1.65,
    );
  }

  static TextStyle styleBold20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize:SizeConfig.isWideScreen?35: 20),
      fontWeight: FontWeight.w700,
      color: Colors.black,
      height: 1.65,
    );
  }

  static TextStyle styleSemiBold16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: SizeConfig.isWideScreen?34:16),
      fontWeight: FontWeight.w600,
      color: Colors.white,
      height: 1.65,
    );
  }

  static TextStyle styleRegular20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize:SizeConfig.isWideScreen?35: 20),
      fontWeight: FontWeight.w400,
      color: Color(0xffFFFFFF).withOpacity(0.8),
      height: 1.65,
    );
  }
    static TextStyle styleRegular18(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize:SizeConfig.isWideScreen?24: 18),
      fontWeight: FontWeight.w400,
      color: Color(0xff141F1F),
      height: 1.65,
    );
  }

  static TextStyle styleMedium20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize:SizeConfig.isWideScreen?30: 20),
      fontWeight: FontWeight.w500,
      color: Color(0xff12A0FF),
    );
  }

  static TextStyle styleMedium18(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize:SizeConfig.isWideScreen?26: 18),
      fontWeight: FontWeight.w500,
      color: Color(0xffA4ACAD),
    );
  }

  static TextStyle styleNormal18(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize:SizeConfig.isWideScreen?24: 18),
      fontWeight: FontWeight.w400,
      color: buttonColor,
    );
  }

  static TextStyle styleRegular16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize:SizeConfig.isWideScreen?25: 20),
      fontWeight: FontWeight.w400,
      color: Color(0xffC9CECF),
    );
  }
  static TextStyle styleMedium16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize:SizeConfig.isWideScreen?25: 16),
      fontWeight: FontWeight.w500,
      color: Color(0xff4E5556),
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
