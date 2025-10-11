import 'package:flutter/material.dart' as flutter;
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

    final tasksForDay = requests.where((r) {
      final reqDate = DateTime.parse(r.date);
      return reqDate.year == dayDate.year &&
          reqDate.month == dayDate.month &&
          reqDate.day == dayDate.day;
    }).toList();

    if (tasksForDay.isEmpty) {
      return flutter.Center(
        child: flutter.Text(
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
        return TeskCard(request: r);
      },
    );
  }
}
