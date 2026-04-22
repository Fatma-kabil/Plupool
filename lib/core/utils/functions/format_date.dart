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