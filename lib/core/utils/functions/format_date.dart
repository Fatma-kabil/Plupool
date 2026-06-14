import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// 6/5/2020
String formatDate(DateTime date) {
  return DateFormat('yyyy/M/d', 'ar').format(date);
}

String formatMonthDate(DateTime date) {
  return DateFormat('EEEE : yyyy/M/d', 'ar').format(date);
}

String formatArabicDate(String date) {
  final parsedDate = DateTime.parse(date);

  return DateFormat('yyyy/M/d - h:mm a', 'ar').format(parsedDate);
}

String formatArabicDateOnly(String date) {
  final parsedDate = DateTime.parse(date);

  return DateFormat('yyyy/M/d ', 'ar').format(parsedDate);
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

String formatArabicDate2(DateTime date) {
  return DateFormat('yyyy/M/d - h:mm a', 'ar').format(date);
}String timeAgo(DateTime date) {
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