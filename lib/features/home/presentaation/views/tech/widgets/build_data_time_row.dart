import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/tasks/domain/entities/task_entity.dart';

class BuildDataTimeRow extends StatelessWidget {
  const BuildDataTimeRow({super.key, required this.task});
  final TaskEntity task;

  @override
  Widget build(BuildContext context) {
    return
    /// ويدجت للتاريخ والوقت
    Row(
      textDirection: TextDirection.rtl,
      children: [
        Icon(
          Icons.calendar_today,
          size: SizeConfig.w(12),
          color: Color(0xff999999),
        ),
        SizedBox(width: SizeConfig.w(6)),
        Text(
          textDirection: TextDirection.rtl,
          '${formatArabicDateOnly(task.scheduledDate)} - ${formatTimeArabic3(task.scheduledTime)}',
          style: AppTextStyles.styleRegular13(
            context,
          ).copyWith(color: const Color(0xff999999)),
        ),
      ],
    );
  }
}
