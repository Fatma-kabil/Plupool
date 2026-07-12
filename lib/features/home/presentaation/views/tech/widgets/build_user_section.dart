import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/tasks/domain/entities/task_entity.dart';

class BuildUserSection extends StatelessWidget {
  const BuildUserSection({
    super.key,
    required this.task,
  });

  final TaskEntity task;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        CircleAvatar(
          radius: SizeConfig.w(16),
          backgroundImage: task.customerAvatar != null &&
                  task.customerAvatar!.isNotEmpty
              ? NetworkImage(task.customerAvatar!)
              : null,
          child: task.customerAvatar == null || task.customerAvatar!.isEmpty
              ? const Icon(Icons.person)
              : null,
        ),
        SizedBox(width: SizeConfig.w(8)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.customerName,
              style: AppTextStyles.styleSemiBold16(
                context,
              ).copyWith(
                color: const Color(0xff555555),
              ),
            ),
            const SizedBox(height: 2),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Icon(
                  Icons.location_on,
                  size: SizeConfig.w(14),
                  color: const Color(0xff999999),
                ),
                Text(
                  task.locationName,
                  style: AppTextStyles.styleRegular13(
                    context,
                  ).copyWith(
                    color: const Color(0xff999999),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}