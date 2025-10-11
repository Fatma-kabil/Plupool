import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/features/home/data/models/service_request_model.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/service_request_card.dart';

class WeeklyRequestsList extends StatelessWidget {
  const WeeklyRequestsList({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final startDate = DateTime(now.year, now.month, now.day);
    final endDate = startDate.add(const Duration(days: 7));

    // 🧮 الطلبات خلال الأسبوع القادم
    final upcomingWeekRequests = requests.where((r) {
      try {
        final date = DateFormat('yyyy-MM-dd').parse(r.date);
        return !date.isBefore(startDate) && !date.isAfter(endDate);
      } catch (_) {
        return false;
      }
    }).toList();

    // 🔹 دالة تساعدنا نحول الوقت العربي لصيغة مفهومة
    DateTime _combineDateTime(ServiceRequest r) {
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

    // 🔸 الترتيب حسب التاريخ + الوقت بدقة
    upcomingWeekRequests.sort((a, b) {
      final da = _combineDateTime(a);
      final db = _combineDateTime(b);
      return da.compareTo(db);
    });

    if (upcomingWeekRequests.isEmpty) {
      return const Center(
        child: Text('لا توجد طلبات خلال الأسبوع القادم 🌤️'),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) =>
          ServiceRequestCard(request: upcomingWeekRequests[index]),
    );
  }
}
