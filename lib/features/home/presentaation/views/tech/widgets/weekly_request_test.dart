import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/utils/functions/combine_data_time.dart';
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

  
    // 🔸 الترتيب حسب التاريخ + الوقت بدقة
    upcomingWeekRequests.sort((a, b) {
      final da = combineDateTime(a);
      final db = combineDateTime(b);
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
     itemCount: upcomingWeekRequests.length > 3
    ? 3
    : upcomingWeekRequests.length,

      itemBuilder: (context, index) =>
          ServiceRequestCard(request: upcomingWeekRequests[index]),
    );
  }
}
