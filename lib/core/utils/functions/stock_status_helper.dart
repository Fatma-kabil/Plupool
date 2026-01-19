import 'package:flutter/material.dart';

String getStockText(int stock) {
  if (stock == 0) {
    return 'غير متوفر';
  } else if (stock <= 5) {
    return 'متوفر قليل';
  } else {
    return 'متوفر';
  }
}

Color getStockColor(int stock) {
  if (stock == 0) {
    return Color(0xffEA5A65);
  } else if (stock <= 5) {
    return Color(0xffFF9F1C);
  } else {
    return  Color(0xff05B285);
  }
}
