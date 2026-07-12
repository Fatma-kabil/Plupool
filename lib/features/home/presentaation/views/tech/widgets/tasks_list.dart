import 'package:flutter/material.dart' as flutter;
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/tasks/domain/entities/task_entity.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/task_card.dart';

class TasksList extends flutter.StatelessWidget {
  final DateTime startDate;
  final int dayIndex;
  final List<TaskEntity> tasks;

  const TasksList({
    super.key,
    required this.startDate,
    required this.dayIndex,
    required this.tasks,
  });

  @override
  flutter.Widget build(flutter.BuildContext context) {
    final dayDate = startDate.add(Duration(days: dayIndex));

    final tasksForDay = tasks.where((task) {
      final date = DateTime.parse(task.scheduledDate);

      return date.year == dayDate.year &&
          date.month == dayDate.month &&
          date.day == dayDate.day;
    }).toList();

    tasksForDay.sort((a, b) {
      final da = DateTime.parse(
        '${a.scheduledDate} ${a.scheduledTime}',
      );

      final db = DateTime.parse(
        '${b.scheduledDate} ${b.scheduledTime}',
      );

      return da.compareTo(db);
    });

    if (tasksForDay.isEmpty) {
      return flutter.Center(
        child: flutter.Text(
          'النهارده بريك 😎',
          style: AppTextStyles.styleMedium20(context).copyWith(
            color: AppColors.ktextcolor,
          ),
        ),
      );
    }

    return flutter.ListView.builder(
      itemCount: tasksForDay.length,
      itemBuilder: (context, index) {
        return flutter.Padding(
          padding: flutter.EdgeInsets.only(
            bottom: SizeConfig.h(5),
          ),
          child: TeskCard(
            task: tasksForDay[index],
          ),
        );
      },
    );
  }
}