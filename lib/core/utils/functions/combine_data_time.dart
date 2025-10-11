// 🔹 دالة تساعدنا نحول الوقت العربي لصيغة مفهومة
import 'package:plupool/features/home/data/models/service_request_model.dart';

import 'package:intl/intl.dart';

DateTime combineDateTime(ServiceRequest r) {
  final date = DateFormat('yyyy-MM-dd').parse(r.date);

  // نحاول نقرأ الوقت (ص/م) بطريقة يدوية ومضمونة
  final timeStr = r.time.trim();

  // مثال: "9:00 ص" أو "1:30 م"
  final parts = timeStr.split(' ');
  if (parts.length < 2) return date;

  final timePart = parts[0];
  final period = parts[1]; // ص أو م

  final timeNums = timePart.split(':');
  int hour = int.parse(timeNums[0]);
  int minute = timeNums.length > 1 ? int.parse(timeNums[1]) : 0;

  if (period.contains('م') && hour < 12) {
    hour += 12; // 1 م تبقى 13
  } else if (period.contains('ص') && hour == 12) {
    hour = 0; // 12 ص تبقى منتصف الليل
  }

  return DateTime(date.year, date.month, date.day, hour, minute);
}
