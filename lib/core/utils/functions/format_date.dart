import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';

// 6/5/2020
String formatDate(DateTime date) {
  return DateFormat('yyyy/M/d', 'ar').format(date);
}

String formatMonthDate(DateTime date) {
  return DateFormat('EEEE : yyyy/M/d', 'ar').format(date);
}

String formatMonthDate2(String? value) {
  if (value == null || value.trim().isEmpty) return '';

  // لو الـ API بيرجع:
  // الخميس : 20/8/2026

  final parts = value.split(':');

  if (parts.length < 2) {
    return toArabicNumbers(value);
  }

  final datePart = parts.sublist(1).join(':').trim();

  // datePart = 20/8/2026
  final dateParts = datePart.split('/');

  if (dateParts.length != 3) {
    return toArabicNumbers(value);
  }

  final day = dateParts[0];
  final month = dateParts[1];
  final year = dateParts[2];

  final dayName = parts[0].trim();

  return '$dayName : ${toArabicNumbers(year)}${toArabicNumbers(month)}/${toArabicNumbers(day)}';
}

String formatArabicDate(String date) {
  final parsedDate = DateTime.parse(date);

  return DateFormat('yyyy/M/d - h:mm a', 'ar').format(parsedDate);
}

String formatArabicDateOnly(String? dateString) {
  final parsedDate = DateTime.tryParse(dateString ?? '');
  if (parsedDate == null) return '-';

  return DateFormat('yyyy/M/d', 'ar').format(parsedDate);
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

String formatTimeArabic2(DateTime time) {
  return DateFormat('h:mm a', 'ar').format(time);
}

String formatTimeArabic3(String? value) {
  if (value == null || value.trim().isEmpty) return "";

  try {
    DateTime parsed;

    if (value.contains('T')) {
      parsed = DateTime.parse(value);
    } else if (value.length == 5) {
      // 09:00
      parsed = DateFormat("HH:mm").parse(value);
    } else if (value.length == 8) {
      // 09:00:00
      parsed = DateFormat("HH:mm:ss").parse(value);
    } else {
      return value;
    }

    return DateFormat('h:mm a', 'ar').format(parsed);
  } catch (e) {
    return value;
  }
}

String formatTimeArabic4(String? value) {
  if (value == null || value.trim().isEmpty) return '';

  value = value.trim();

  // مثال: 01:47 AM
  final parts = value.split(' ');

  final timePart = parts[0];

  String period = '';

  if (parts.length > 1) {
    final apiPeriod = parts[1].toUpperCase();

    if (apiPeriod == 'AM') {
      period = 'ص';
    } else if (apiPeriod == 'PM') {
      period = 'م';
    }
  }

  // تحويل الأرقام فقط
  final arabicTime = toArabicNumbers(timePart);

  if (period.isEmpty) {
    return arabicTime;
  }

  return '$arabicTime $period';
}

String formatArabicDate2(DateTime date) {
  return DateFormat('yyyy/M/d - h:mm a', 'ar').format(date);
}

String timeAgo(DateTime date) {
  final now = DateTime.now();
  final diff = now.difference(date);

  if (diff.inSeconds < 60) {
    return "الآن";
  }

  final totalMinutes = diff.inMinutes;
  // final totalHours = diff.inHours;
  final totalDays = diff.inDays;

  final years = totalDays ~/ 365;
  final months = (totalDays % 365) ~/ 30;
  final days = (totalDays % 365) % 30;

  final hours = diff.inHours % 24;
  final minutes = diff.inMinutes % 60;

  // =======================
  // سنة + شهر
  // =======================
  if (years > 0) {
    if (months > 0) {
      return "منذ $years سنة و $months شهر";
    }
    return "منذ $years سنة";
  }

  // =======================
  // شهر + يوم
  // =======================
  if (months > 0) {
    if (days > 0) {
      return "منذ $months شهر و $days يوم";
    }
    return "منذ $months شهر";
  }

  // =======================
  // يوم + ساعة
  // =======================
  if (days > 0) {
    if (hours > 0) {
      return "منذ $days يوم و $hours ساعة";
    }
    return "منذ $days يوم";
  }

  // =======================
  // ساعة + دقيقة
  // =======================
  if (hours > 0) {
    if (minutes > 0) {
      return "منذ $hours ساعة و $minutes دقيقة";
    }
    return "منذ $hours ساعة";
  }

  // =======================
  // دقيقة
  // =======================
  if (totalMinutes > 0) {
    return "منذ $totalMinutes دقيقة";
  }

  return "الآن";
}

TimeOfDay parseTime(String time) {
  final parts = time.split(':');
  return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
}
