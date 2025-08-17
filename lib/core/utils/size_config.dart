import 'package:flutter/material.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;

  static late double defaultSize;
  static late Orientation orientation;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.sizeOf(context).width;
    screenHeight = MediaQuery.sizeOf(context).height;
    orientation = MediaQuery.orientationOf(context);
  }

  // نسبة من عرض الشاشة
  static double w(double inputWidth) {
    return (inputWidth / 360.0) * screenWidth;
  }

  // نسبة من ارتفاع الشاشة
  static double h(double inputHeight) {
    return (inputHeight / 740.6666) * screenHeight;
  }

}
