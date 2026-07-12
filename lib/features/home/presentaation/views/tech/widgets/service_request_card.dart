import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/functions/build_statue_label.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/build_data_time_row.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/build_user_section.dart';
import 'package:plupool/features/tasks/domain/entities/task_entity.dart';

class ServiceRequestCard extends StatelessWidget {
  final TaskEntity task;

  const ServiceRequestCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final colors = RequestStatusColors.getColors(mapApiStatus(task.status));

    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.h(12)),
      decoration: BoxDecoration(
        color: colors['bg'],
        border: Border.all(color: colors['border']),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(12),
          vertical: SizeConfig.h(12),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitle(context),
                    const SizedBox(height: 4),
                    BuildDataTimeRow(task: task),
                  ],
                ),
                const Spacer(),
                buildStatusLabel(colors, context, mapApiStatus(task.status)),
              ],
            ),
            const SizedBox(height: 10),
            BuildUserSection(task: task),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) => Text(
    task.title,
    style: AppTextStyles.styleSemiBold16(
      context,
    ).copyWith(color: AppColors.ktextcolor),
  );
}
