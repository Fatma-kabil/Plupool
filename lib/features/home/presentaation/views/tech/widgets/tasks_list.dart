import 'package:flutter/material.dart' as flutter;
import 'package:plupool/core/utils/functions/combine_data_time.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/service_request_model.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/task_card.dart';

class TasksList extends flutter.StatelessWidget {
  final DateTime startDate;
  final int dayIndex;
  final List<ServiceRequest> requests;

  const TasksList({
    super.key,
    required this.startDate,
    required this.dayIndex,
    required this.requests,
  });

  @override
  flutter.Widget build(flutter.BuildContext context) {
    final dayDate = startDate.add(Duration(days: dayIndex));

    // 🔹 فلترة المهام الخاصة باليوم المحدد
    final tasksForDay = requests.where((r) {
      final reqDate = DateTime.parse(r.date);
      return reqDate.year == dayDate.year &&
          reqDate.month == dayDate.month &&
          reqDate.day == dayDate.day;
    }).toList();

    // ✅ ترتيب المهام حسب الوقت
    tasksForDay.sort((a, b) {
  final da = combineDateTime(a);
  final db = combineDateTime(b);
  return da.compareTo(db);
});

    if (tasksForDay.isEmpty) {
      return flutter.Center(
        child: flutter.Text(
          textDirection: flutter.TextDirection.rtl,
          'النهارده بريك 😎',
          style: flutter.TextStyle(
            color: flutter.Colors.grey.shade600,
            fontSize: 16,
          ),
        ),
      );
    }

    return flutter.ListView.builder(
      itemCount: tasksForDay.length,
      itemBuilder: (context, index) {
        final r = tasksForDay[index];
        return flutter.Padding(
          padding: flutter.EdgeInsets.only(bottom: SizeConfig.h(5)),
          child: TeskCard(request: r),
        );
      },
    );
  }
}
