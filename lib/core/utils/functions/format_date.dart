import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// 6/5/2020
String formatDate(DateTime date) {
  return DateFormat('yyyy/M/d', 'ar').format(date);

 
}
String formatArabicDate(String date) {
  final parsedDate = DateTime.parse(date);

  return DateFormat(
    'yyyy/M/d - h:mm a',
    'ar',
  ).format(parsedDate);
}

String formatPhoneNumber(String phone) {
  String cleaned = phone.replaceAll(' ', '').replaceAll('+', '');

  // لو الرقم مصري (11 رقم بعد 20)
  if (cleaned.startsWith('20')) {
    cleaned = cleaned.substring(2);
    return '+20 ${cleaned.substring(0, 3)} ${cleaned.substring(3, 6)} ${cleaned.substring(6)}';
  }

  return '+$cleaned';
}
String formatTimeArabic(TimeOfDay time) {
  final dt = DateTime(0, 0, 0, time.hour, time.minute);
  return DateFormat('h:mm a', 'ar').format(dt);
}